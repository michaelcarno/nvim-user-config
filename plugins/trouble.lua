return {
  "folke/trouble.nvim",
  event = "BufRead",
  config = function()
    require("trouble").setup({
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<esc>" },
        cancel = "<c-e>",
      }
    })

    vim.keymap.set("n", "<leader>lt", "<cmd>TroubleToggle<cr>", { desc = "Show/Hide Trouble list" })
  end
}
