return {
  "nvim-telescope/telescope-file-browser.nvim",
  event = "VeryLazy",
  config = function()
    require("telescope").load_extension "file_browser"
  end,
  keys = {
    {
      "<leader>fs",
      "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
      desc = "Open file browser in current folder"
    }
  }
}
