return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",


  {
    "michaelcarno/mctheme",
    opts = { "mctheme" },
    lazy = false,
    priority = 1000,
  },
  {
    "monkoose/matchparen.nvim",
    event = "VeryLazy",
    enabled = false,
    config = function()
      require('matchparen').setup({
        on_startup = true,         -- Should it be enabled by default
        hl_group = 'MatchParen',   -- highlight group of the matched brackets
        augroup_name = 'matchparen', -- almost no reason to touch this unless there is already augroup with such name
        debounce_time = 100,       -- debounce time in milliseconds for rehighlighting of brackets.
      })
    end
  },
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    enabled = true,
    config = function()
      vim.g.matchup_matchparen_IdleLimitTime=1000000
      -- vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.g.matchup_matchparen_matchup_surround_enabled = 1
      vim.g.matchup_transmute_enabled = 1
    end
    },
  --
  -- {
  --   "karb94/neoscroll.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require('neoscroll').setup({
  --       -- All these keys will be mapped to their corresponding default scrolling animation
  --       mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
  --         '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
  --       hide_cursor = true,          -- Hide cursor while scrolling
  --       stop_eof = true,             -- Stop at <EOF> when scrolling downwards
  --       respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
  --       cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
  --       easing_function = nil,       -- Default easing function
  --       pre_hook = nil,              -- Function to run before the scrolling animation starts
  --       post_hook = nil,             -- Function to run after the scrolling animation ends
  --       performance_mode = false,    -- Disable "Performance Mode" on all buffers.
  --     })
  --   end
  -- },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require('nvim-surround').setup()
    end
  },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  },
  {
    --   "lewis6991/hover.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("hover").setup {
    --       init = function()
    --         -- Require providers
    --         require("hover.providers.lsp")
    --         require('hover.providers.gh')
    --         require('hover.providers.gh_user')
    --         -- require('hover.providers.jira')
    --         -- require('hover.providers.man')
    --         -- require('hover.providers.dictionary')
    --       end,
    --       preview_opts = {
    --         border = nil
    --       },
    --       -- Whether the contents of a currently open hover window should be moved
    --       -- to a :h preview-window when pressing the hover keymap.
    --       preview_window = false,
    --       title = true
    --     }
    --
    --     -- Setup keymaps
    --     vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
    --     vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
    --   end
  },
  -- { 'ldelossa/litee.nvim' },
  -- event = "BufRead",
  -- config = function()
  -- end
  -- ,
  -- {
  --   'ldelossa/gh.nvim',
  --   event = "BufRead",
  --   config = function()
  --     require('litee.lib').setup()
  --     require('litee.gh').setup(
  --       {
  --         -- deprecated, around for compatability for now.
  --         jump_mode             = "invoking",
  --         -- remap the arrow keys to resize any litee.nvim windows.
  --         map_resize_keys       = false,
  --         -- do not map any keys inside any gh.nvim buffers.
  --         disable_keymaps       = false,
  --         -- the icon set to use.
  --         icon_set              = "default",
  --         -- any custom icons to use.
  --         icon_set_custom       = nil,
  --         -- whether to register the @username and #issue_number omnifunc completion
  --         -- in buffers which start with .git/
  --         git_buffer_completion = true,
  --         -- defines keymaps in gh.nvim buffers.
  --         keymaps               = {
  --           -- when inside a gh.nvim panel, this key will open a node if it has
  --           -- any futher functionality. for example, hitting <CR> on a commit node
  --           -- will open the commit's changed files in a new gh.nvim panel.
  --           open = "<CR>",
  --           -- when inside a gh.nvim panel, expand a collapsed node
  --           expand = "zo",
  --           -- when inside a gh.nvim panel, collpased and expanded node
  --           collapse = "zc",
  --           -- when cursor is over a "#1234" formatted issue or PR, open its details
  --           -- and comments in a new tab.
  --           goto_issue = "gd",
  --           -- show any details about a node, typically, this reveals commit messages
  --           -- and submitted review bodys.
  --           details = "d",
  --           -- inside a convo buffer, submit a comment
  --           submit_comment = "<C-s>",
  --           -- inside a convo buffer, when your cursor is ontop of a comment, open
  --           -- up a set of actions that can be performed.
  --           actions = "<C-a>",
  --           -- inside a thread convo buffer, resolve the thread.
  --           resolve_thread = "<C-r>",
  --           -- inside a gh.nvim panel, if possible, open the node's web URL in your
  --           -- browser. useful particularily for digging into external failed CI
  --           -- checks.
  --           goto_web = "gx"
  --         }
  --       }
  --     )
  --   end
  -- }
}
