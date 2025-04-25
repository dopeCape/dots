-- Add this to your init.lua or in a separate module that's loaded
local m = {}
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local previewers = require "telescope.previewers"

-- Function to find TypeScript type declarations
m.find_ts_type_declarations = function()
  -- Try to get TypeScript language server client
  local ts_clients = vim.lsp.get_clients { name = "tsserver" }
  -- Request workspace symbols from the LSP with empty query to get all symbols
  vim.lsp.buf_request(0, "workspace/symbol", { query = "" }, function(err, result, _, _)
    if err or not result then
      vim.notify("Error fetching symbols: " .. (err or "No results"), vim.log.levels.ERROR)
      return
    end
    local symbols = {}
    for _, symbol in ipairs(result) do
      if symbol.kind == 13 then
        table.insert(symbols, {
          name = symbol.name,
          container = symbol.containerName or "",
          kind = symbol.kind,
          location = symbol.location,
          uri = symbol.location.uri,
          range = symbol.location.range,
        })
      end
    end

    -- Function to check if the symbol is a type declaration
    local function is_type_declaration(location)
      local uri = location.uri
      local range = location.range
      local filepath = vim.uri_to_fname(uri)
      -- Read the file content
      local ok, lines = pcall(vim.fn.readfile, filepath)
      if not ok then return false end
      local line_num = range.start.line + 1 -- LSP uses 0-based line numbers
      if line_num > #lines then return false end
      local line = lines[line_num]
      -- Check for "type Name" pattern
      return line:match "^%s*export%s+type%s+" ~= nil or line:match "^%s*type%s+" ~= nil
    end

    -- Filter results to only include type declarations
    local filtered_symbols = {}
    for _, symbol in ipairs(symbols) do
      if is_type_declaration(symbol.location) then
        local filepath = vim.uri_to_fname(symbol.location.uri)
        local display = "Type: " .. (symbol.container ~= "" and (symbol.container .. ".") or "") .. symbol.name
        table.insert(filtered_symbols, {
          display = display,
          location = symbol.location,
          name = symbol.name,
          kind = "Type Declaration",
          filepath = filepath,
        })
      end
    end

    if #filtered_symbols == 0 then
      vim.notify("No TypeScript type declarations found", vim.log.levels.INFO)
      return
    end

    -- Custom previewer that gets the full type definition using LSP
    local type_previewer = previewers.new_buffer_previewer {
      title = "Type Definition",
      define_preview = function(self, entry, status)
        local bufnr = self.state.bufnr
        vim.api.nvim_buf_set_option(bufnr, "filetype", "typescript")

        -- Set loading message
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Loading type definition..." })

        -- Use LSP to get hover information which contains the full type
        local params = {
          textDocument = {
            uri = entry.value.location.uri,
          },
          position = entry.value.location.range.start,
        }

        -- Send hover request to get full type information
        vim.lsp.buf_request_all(0, "textDocument/hover", params, function(hresults)
          -- Process hover results
          local contents = {}
          for _, hresult in pairs(hresults) do
            if hresult.result and hresult.result.contents then
              local hover_content = hresult.result.contents
              if type(hover_content) == "string" then
                table.insert(contents, hover_content)
              elseif hover_content.kind then
                -- It's a MarkedString
                table.insert(contents, hover_content.value)
              elseif type(hover_content) == "table" then
                -- It's an array of MarkedStrings or MarkupContent
                for _, content in ipairs(hover_content) do
                  if type(content) == "string" then
                    table.insert(contents, content)
                  elseif content.value then
                    table.insert(contents, content.value)
                  end
                end
              end
            end
          end

          -- Update buffer with hover contents
          if #contents > 0 then
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(bufnr) then
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, vim.split(table.concat(contents, "\n"), "\n"))
              end
            end)
          else
            -- If no hover info, load the file and show the declaration
            local filepath = entry.value.filepath
            local ok, lines = pcall(vim.fn.readfile, filepath)
            if ok and vim.api.nvim_buf_is_valid(bufnr) then
              vim.schedule(function()
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
                -- Highlight the relevant range
                local start_line = entry.value.location.range.start.line
                local end_line = entry.value.location.range["end"].line
                vim.api.nvim_win_set_cursor(self.state.preview_win, { start_line + 1, 0 })
                vim.api.nvim_buf_add_highlight(bufnr, -1, "TelescopeSelectionCaret", start_line, 0, -1)
              end)
            end
          end
        end)
      end,
    }

    -- Create a Telescope picker with preview
    pickers
      .new({}, {
        prompt_title = "TypeScript Type Declarations",
        finder = finders.new_table {
          results = filtered_symbols,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry.display,
              ordinal = entry.display,
            }
          end,
        },
        sorter = conf.generic_sorter {},
        attach_mappings = function(prompt_bufnr, map)
          -- Add mapping for copying type content (Ctrl+y)
          map("i", "<C-y>", function()
            local selection = action_state.get_selected_entry()
            if selection and selection.value then
              -- Get the current buffer content from the preview window (which now has the full type definition)
              local preview_bufnr = require("telescope.state").get_status(prompt_bufnr).preview_bufnr
              if preview_bufnr then
                local lines = vim.api.nvim_buf_get_lines(preview_bufnr, 0, -1, false)
                local content = table.concat(lines, "\n")

                -- Extract just the type definition parts (try to extract content between braces)
                local type_content = content:match "{(.-)}"
                if type_content then
                  -- Cleanup and format
                  type_content = type_content:gsub("^%s*", ""):gsub("%s*$", "")
                  vim.fn.setreg("+", type_content)
                  vim.fn.setreg('"', type_content)
                else
                  -- If we can't find braces, just copy the whole thing
                  vim.fn.setreg("+", content)
                  vim.fn.setreg('"', content)
                end
                vim.notify("Type content copied to clipboard", vim.log.levels.INFO)
              end
            end
          end)

          -- Keep the default select action
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            if selection and selection.value and selection.value.location then
              -- Navigate to the location
              local loc = selection.value.location
              vim.lsp.util.jump_to_location(loc, "utf-8")
            end
          end)
          return true
        end,
      })
      :find()
  end)
end

return m
