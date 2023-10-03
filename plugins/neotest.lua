local prefix = "<leader>tt"
return {
  {
    "nvim-neotest/neotest-jest",
    event = "VeryLazy",
    config = function()
    end
  },
  {
    "nvim-neotest/neotest-plenary",
    event = "VeryLazy",
    config = function()
    end
  },
  {
    "nvim-neotest/neotest-python",
    event = "VeryLazy",
    config = function()
    end
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            dap = { justMyCode = false },
          }),
          require("neotest-plenary"),
          require("neotest-jest")({
            jestCommand = "npm test --",
            jestConfigFile = "jest.config.ts",
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          }),
          -- require("neotest-vim-test")({
          --   ignore_file_types = { "python", "vim", "lua" },
          -- }),
        },
        icons = {
          running_animated =
          { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        }
      });

      -- maps.n["<leader>T"] = { desc = "Tests" };
    end,
    keys = {
      { prefix,        desc = 'Tests' },
      { prefix .. "r", function() require("neotest").run.run() end,                        desc = 'Run nearest test' },
      { prefix .. "s", "<cmd>Neotest stop<CR>",                                            desc = 'Stop test' },
      { prefix .. "a", function() require("neotest").summary.toggle() end,                 desc = 'Run toggle summary' },
      { prefix .. "o", function() require("neotest").output.open({ enter = true }) end,    desc = 'Show output' },
      { prefix .. "p", function() require("neotest").output_panel.toggle() end,            desc = 'Show output panel' },
      { prefix .. "f", function() require("neotest").run.run(vim.fn.expand("%")) end,      desc = 'Run file' },
      { prefix .. "d", function() require("neotest").run.run({ strategy = "dap" }) end,    desc = 'Debug test file' },
      { prefix .. "w", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,
                                                                                             desc =
        'Test watch current file' },
      { prefix .. "l", function() require("neotest").run.run_last() end,                   desc = "Run last test" }
    }
  } }
