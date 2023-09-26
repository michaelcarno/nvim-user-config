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
        running_animated =
        { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
      });

      -- maps.n["<leader>T"] = { desc = "Tests" };
    end,
    keys = {
      { prefix,        desc = 'Tests' },
      { prefix .. "r", "<cmd>Neotest run<CR>",                                          desc = 'Run nearest test' },
      { prefix .. "s", "<cmd>Neotest stop<CR>",                                         desc = 'Stop test' },
      { prefix .. "l", "<cmd>Neotest summary<CR>",                                      desc = 'Run toggle summary' },
      { prefix .. "o", "<cmd>Neotest output<CR>",                                       desc = 'Show output' },
      { prefix .. "p", "<cmd>Neotest output-panel<CR>",                                 desc = 'Show output panel' },
      { prefix .. "f", "<cmd>Neotest run file<CR>",                                     desc = 'Run file' },
      { prefix .. "d", function() require("neotest").run.run({ strategy = "dap" }) end, desc = 'Debug test file' },
    }
  } }
