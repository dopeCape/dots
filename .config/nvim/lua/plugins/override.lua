return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- override the options table that is used
    -- in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- local highlight = {
      --   "CursorColumn",
      --   "Whitespace",
      -- }
      -- opts.indent.highlight = highlight
      opts.indent.char = ""
      -- opts.whitespace = {
      --   highlight = highlight,
      --   remove_blankline_trail = false,
      -- }
      -- opts.scope = { enabled = false }
    end,
  },
  -- customize treesitter parsers
}
