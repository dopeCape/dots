-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "kanagawa-dragon",
    highlights = {
      init = {
        FloatBorder = { bg = "none", fg = "none", blend = 100 },
        WhichKeyDesc = { bg = "none", fg = "none", blend = 100 },
        StatusLine = { bg = "#181616", fg = "#ffffff", blend = 100 },
        StatusLineNC = { bg = "#181616", fg = "#ffffff" },
      },
      ["kanagawa-dragon"] = {
        StatusLine = { bg = "#181616", fg = "#ffffff" },
        StatusLineNC = { bg = "#181616", fg = "#ffffff" },
      },
      astrodark = {},
    },
    icons = {
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
        bg = "#181616",
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
