return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  enabled= false,
  opts = {},
  config = function()
    require("lsp_lines").setup()
  end,
}
