return {
  "nvim-telescope/telescope-live-grep-args.nvim",
  event = "VeryLazy",
  opts = function() require("telescope").load_extension "live_grep_args" end,
  config = function()
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup {
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {         -- extend mappings
            i = {
              ["<C-'>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        }
      }
    }
  end,
  keys = {
    { "<leader>fg", "<cmd>Telescope live_grep_args<CR>", desc = "Live grep with args" }
  }
}
