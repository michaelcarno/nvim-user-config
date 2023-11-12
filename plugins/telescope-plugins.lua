return {
  --   {
  --     "paopaol/telescope-git-diffs.nvim",
  --     event = "VeryLazy",
  --     config = function()
  --       require('telescope').load_extension('git_diffs')
  --     end,
  --   },
  --   {
  --   'piersolenski/telescope-import.nvim',
  --   event = "VeryLazy",
  --   dependencies = 'nvim-telescope/telescope.nvim',
  --   config = function()
  --     require("telescope").load_extension("import")
  --   end
  -- },
  -- {
  --   'TC72/telescope-tele-tabby.nvim',
  --   event = "VeryLazy",
  --   dependencies = 'nvim-telescope/telescope.nvim',
  --   config = function()
  --     require("telescope").load_extension("tele_tabby")
  --   end
  -- }

  {
    "smartpde/telescope-recent-files",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("recent_files")
    end,
    keys = {
      { "<leader>fo", function() require('telescope').extensions.recent_files.pick() end, desc = "Open recent files" }
    }
  },
  {
    "chip/telescope-software-licenses.nvim",
    event = "VeryLazy",
    config = function()
      require("telescope").load_extension("software-licenses")
    end,
    keys = {
      { "<leader>fll", "<cmd>Telescope software-licenses find<CR>", desc = "Find software license text" },
    }
  }
}
