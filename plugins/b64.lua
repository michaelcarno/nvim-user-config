return {
  "taybart/b64.nvim",
  event = "BufRead",
  config = function()
    vim.keymap.set("n", "<leader>b4", "<cmd>B64Encode<cr>", { desc = "encoding to base 64" })
    vim.keymap.set("n", "<leader>b6", "<cmd>B64Decode<cr>", { desc = "decoding from base 64" })
  end
}
