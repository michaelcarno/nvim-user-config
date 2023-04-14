return {
  "mbbill/undotree",
  event = "BufRead",
  config = function()
    vim.keymap.set("n", "<leader>z", "<cmd>UndotreeToggle<cr>", { desc = "Undo tree" })
  end
}
