return {
  "jay-babu/mason-nvim-dap.nvim",
  config = function(plugin, opts)
    local nvim_dap = require "mason-nvim-dap"
    nvim_dap.setup(opts) -- run setup
    -- do more configuration as needed
    -- nvim_dap.setup_handlers {
    -- C = function(source, name)
    local dap = require "dap"
    dap.adapters.cpp = {
      type = 'executable',
      attach = {
        pidProperty = "pid",
        pidSelect = "ask"
      },
      command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
      env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
      },
      name = "lldb"
    }
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "cpp",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
        end,
        cwd = '${workspaceFolder}',
        args = {}
      }
    }
    dap.configurations.c = dap.configurations.cpp
    -- end,
    -- python = function(source_name)
    -- local dap = require "dap"
    dap.adapters.python = {
      type = "executable",
      command =
      "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python.exe",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }
    -- require('dap.ext.vscode').load_launchjs(nil, {})
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        justMyCode = true -- This configuration will launch the current file if used.
      },
    }
    -- end,
    -- js = function(source, name)
    -- local dap = require "dap"
    dap.adapters.chrome = {
      type = "executable",
      command = "node",
      args = {
        "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\chrome-debug-adapter\\out\\src\\chromeDebug.js",
        "45635" }
    }
    -- dap.adapters.firefox = {
    --   type = "executable",
    --   command = "node",
    --   args = {
    --     "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\firefox-debug-adapter\\dist\\adapter.bundle.js",
    --     "45635" }
    -- }
    --
    dap.adapters.node2 = {
      type = "executable",
      command = "node",
      port = "${port}",
      args = {
        "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\node-debug2-adapter\\out\\src\\nodeDebug.js",
        "${port}" }
    }

    dap.adapters.node = {
      type = "executable",
      command = "node",
      port = "${port}",
      args = {
        "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\js-debug-adapter\\out\\src\\vsDebugServer.js",
        "${port}" }
    }
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
          .. "/js-debug/src/dapDebugServer.js", "${port}" }

      }
    }
    --
    dap.configurations.javascript = {
      {
        type = "chrome",
        request = "attach",
        program = "${file}",
        -- debugServer = 45635,
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}",
      }
    }
    dap.configurations.typescript = {
      {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        -- debugServer = 45635,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}",
      },
    }
    -- dap.configurations.typescript = {
    --   {
    --     type = "firefox",
    --     request = "attach",
    --     program = "${file}",
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     url = "localhost:4200",
    --     debugServer = 45635,
    --     protocol = "inspector",
    --     port = 9222,
    --     webRoot = "${workspaceFolder}",
    --   },
    -- }
    -- end,
    -- }
  end
}
