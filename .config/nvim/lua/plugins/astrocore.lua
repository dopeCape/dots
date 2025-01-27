-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {

    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = false, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here

    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        foldmarker = " , ",
        number = false, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        showtabline = 0,
        foldcolumn = "0",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },

    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["<C-w>n"] = {
          function()
            vim.wo.number = not vim.wo.number
            vim.wo.relativenumber = not vim.wo.relativenumber
          end,
          desc = "Toggle line numbers",
        },
        ["<Leader>nb"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<Leader>pb"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["-"] = { "<CMD>Oil <CR>" },
        ["<Leader>tne"] = { "<CMD>tabnew <CR>" },
        ["<Leader>tn"] = { "<CMD>tabnext<CR>" },
        ["<Leader>tp"] = { "<CMD>tabprevious <CR>" },
        ["<Leader>os"] = { "<CMD>ObsidianSearch <CR>" },
        ["<Leader>on"] = { "<CMD>ObsidianNew<CR>" },

        ["<C-w>z"] = { "<CMD>WindowsMaximize <CR>" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,
      },
    },
  },
}

-- local harpoon = require("harpoon")
-- harpoon:setup()
-- harpoon:extend({
--   UI_CREATE = function(cx)
--     vim.keymap.set("n", "<C-v>", function()
--       harpoon.ui:select_menu_item({ vsplit = true })
--     end, { buffer = cx.bufnr })
--
--     vim.keymap.set("n", "<C-h>", function()
--       harpoon.ui:select_menu_item({ split = true })
--     end, { buffer = cx.bufnr })
--
--     vim.keymap.set("n", "<C-t>", function()
--       harpoon.ui:select_menu_item({ tabedit = true })
--     end, { buffer = cx.bufnr })
--   end,
-- })
--
--
-- local utils = require "astronvim.utils"
-- local is_available = utils.is_available
-- local ui = require "astronvim.utils.ui"
-- vim.keymap.set("n", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
-- vim.keymap.set("n", "-", "<CMD>Oil <CR>", { desc = "Open parent directory" })
-- local function cmd(command) return table.concat { "<Cmd>", command, "<CR>" } end
-- vim.keymap.set("n", "<Leader>s", cmd "Navbuddy")
-- vim.keymap.set("n", "<C-w>z", cmd "WindowsMaximize")
-- vim.keymap.set("n", "<C-w>_", cmd "WindowsMaximizeVertically")
-- vim.keymap.set("n", "<C-w>|", cmd "WindowsMaximizeHorizontally")
-- vim.keymap.set("n", "<C-w>=", cmd "WindowsEqualize")
-- vim.opt.clipboard = 'unnamedplus'
-- vim.keymap.set("n", "<leader>sc","<cmd>colorscheme gruvbox<CR>")
--
-- local maps = { i = {}, n = {}, v = {}, t = {} }
-- --telekastan
-- -- Launch panel if nothing is typed after <leader>z
-- vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")
--
-- -- Most used functions
-- vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
-- vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
-- vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
-- vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
-- vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
-- vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
-- vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
-- vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
--
-- -- Harpoon
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
--
-- vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
-- vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)
-- vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end)
--
-- vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end)
--
--
