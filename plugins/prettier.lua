return {
  "MunifTanjim/prettier.nvim",
  event = "VeryLazy",
  config = function()
    local prettier = require("prettier")

    prettier.setup({
      bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
      filetypes = {
        "angular",
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
      },
    })
  end
}
