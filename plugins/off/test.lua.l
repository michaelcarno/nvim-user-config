return {
  "nvim-neotest/neotest",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "haydenmeade/neotest-jest" },
  event = "BufRead",
  config = function()
    require("neotest").setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }), }
    })
  end,
  keys = {
    {
      "<leader>Tr",
      function() require('neotest').run.run({ jestCommand = 'jest --watch ' }) end,
      desc = "Run test on current file"
    }
  }
}
