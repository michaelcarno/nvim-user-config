return {
  "piersolenski/telescope-import.nvim",
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension("import")
  end,
  keys = {
    { "fi", "<cmd>Telescope import<CR>", desc = "Telescope import" }
  }
}
