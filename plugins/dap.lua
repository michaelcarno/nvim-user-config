return {
  "mfussenegger/nvim-dap",
  enabled = true, --vim.fn.has "win32" == 0,
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "nvim-dap" },
      cmd = { "DapInstall", "DapUninstall" },
      opts = { automatic_setup = true },
      -- tag = "v2.0.1",
      config = require "plugins.configs.mason-nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      opts = { floating = { border = "rounded" } },
      config = require "plugins.configs.nvim-dap-ui",
    },
  },
  event = "User AstroFile",
}
