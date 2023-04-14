return {
  "ThePrimeagen/harpoon",
  event = "BufRead",
  config = function()
    vim.keymap.set("n", "<leader>ha",
      function() require("harpoon.mark").add_file() end
      , { desc = "Add file" })
    vim.keymap.set("n", "<leader>hs",
      function() require("harpoon.ui").toggle_quick_menu() end
      , { desc = "Show harpooned files" })
  end
}
