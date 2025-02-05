-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "everforest",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        FloatBorder = { bg = "none", fg = "none", blend = 100 },
      },

      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      DiagnosticError = "",
      DiagnosticHint = "",
      DiagnosticInfo = "",
      DiagnosticWarn = "",
    },
    status = {
      colors = {
        bg = "#000000",
        section_bg = "#000000",
        winbar_bg = "#000000",
        winbarnc_bg = "#000000",
        tabline_bg = "#000000",
        tabline_fg = "#000000",
        buffer_bg = "#000000",
        buffer_active_bg = "#000000",
        buffer_visible_bg = "#000000",
        buffer_overflow_bg = "#000000",
        tab_close_bg = "#000000",
        tab_bg = "#000000",
        tab_active_bg = "#000000",
      },
      icon_highlights = {
        file_icon = {
          statusline = false,
        },
      },
    },
  },
}
