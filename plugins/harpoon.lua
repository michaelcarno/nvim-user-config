return {
  "ThePrimeagen/harpoon",
  event = "BufRead",
  config = function()
  end,
  keys = {
    {
      "<leader>ha",
      function() require("harpoon.mark").add_file() end
      ,
      desc = "Add file"
    },
    {
      "<leader>hs",
      function() require("harpoon.ui").toggle_quick_menu() end
      ,
      desc = "Show harpooned files"
    }

  }
}
