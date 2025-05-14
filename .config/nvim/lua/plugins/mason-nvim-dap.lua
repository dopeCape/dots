return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    handlers = {
      delve = function()
        local dap = require "dap"
        dap.adapters.go = {
          type = "server",
          port = 38697,
          host = "127.0.0.1",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:38697" },
          },
        }
        dap.configurations.go = {
          {
            type = "go",
            name = "Attach to Process",
            request = "attach",
            processId = require("dap.utils").pick_process,
            mode = "local",
          },
        }
      end,
    },
  },
}
