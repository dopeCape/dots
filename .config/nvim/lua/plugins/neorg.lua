return {
  "nvim-neorg/neorg",
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            tejes = "~/tejes",
          },
        },
      },
    },
  },
}
