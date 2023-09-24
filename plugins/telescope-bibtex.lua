return {
  "nvim-telescope/telescope-bibtex.nvim",
  event = "VeryLazy",
  ft = { "tex" },
  config = function()
    require "telescope".load_extension("bibtex")
  end,
  keys = {
    -- { "<leader>fl",  "",                          desc = "Latex" },
    { "<leader>flb", "<cmd>Telescope bibtex<CR>", desc = "Bibtex" }
  }
}
