-- Mapping data with "desc" stored directly by vim.keymap.set().
local utils = require "astronvim.utils"
local present, cmp = pcall(require, "cmp")
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"]  = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"]  = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"]  = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"]  = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"]   = { name = "Buffers" },
    ["<leader>h"]   = false, -- remove home screen hotkey
    ["gh"]          = { "_", desc = "First symbols of current line" },
    ["go"]          = { "$", desc = "Last symbol of line" },
    -- ["<M-w>"]      = { "g%", desc = "Go to close parent" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["F2"]          = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- version b4 fix
    -- ["<leader>lG"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search symbol globaly" },
    ["<leader>gm"]  = { "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame for all lines" },
    ["<leader>bC"]  = { "<cmd>%bd<cr>", desc = "Close all buffer" },
    ["<leader>ft"]  = { "<cmd>Trouble<cr>", desc = "Find trouble" },
    ["<leader>tm"]  = { function() utils.toggle_term_cmd "btm --enable_gpu_memory" end, desc = "ToggleTerm btm" },
    ["<leader>fT"]  =
    {
      function()
        require(
          "telescope.builtin"
        ).colorscheme { enable_preview = true }
      end,
      desc = "Find themes"
    },

    ["g<C-d>"]      = { "<C-w><C-]>", desc = "Go to definition in new window" },
    ["<C-w>d"]      = { "<C-w><C-]>", desc = "Go to definition in new window" },
    ["<C-w><C-d>"]  = { "<C-w><C-]>", desc = "Go to definition in new window" },
    -- ["<leader>R"]   = { "<Plug>RestNvim", desc = "Run RestRequest" },
    -- ["<leader>gm"] = { "<cmd>Himalaya bondarenkoma<cr>", desc = "Check email bondarenkoma" },
    -- ["<C-k>"]      = { function()
    --   require('lsp_signature').toggle_float_win()
    -- end, desc = "Toggle signature" },
    --
    ["<C-S-Up>"]    = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    ["<C-S-Down>"]  = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },

    ["<C-S-Left>"]  = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    ["<C-S-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
    ["f;"]          = { "<cmd>Telescope command_history<CR>", desc = "Telescoper command history" },
    ["fq"]          = { "<cmd>Telescope search_history<CR>", desc = "Telescoper search history" },
    ["fj"]          = { "<cmd>Telescope jumplist<CR>", desc = "Telescoper jumplist" },
    ["ff"]          = { function() require("telescope.builtin").find_files { hidden = true, no_ignore = false } end, desc = "Telescoper find files" },
    ["fo"]          = { "<cmd>Oil<cr>", desc = "Oil" },
    ["fg"]          = { "<cmd>Telescope live_grep_args<CR>", desc = "Telescoper find with grep" },
    ["fF"]          = {
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      desc = "Find all files",
    },
    ["fb"]          = {
      function() require("telescope.builtin").buffers { hidden = true, no_ignore = true } end,
      desc = "Find buffers",
    },
    ["<M-w>"]       = { "%", desc = "Go to close parent" },
    ["gD"]       = { "<cmd>Glance definitions<cr>", desc = "go to definition" },
    ["gR"]       = { "<cmd>Glance references<cr>", desc = "go to references" },
    ["gY"]       = { "<cmd>Glance type_definitions<cr>", desc = "go to type definitions" },
    ["gM"]       = { "<cmd>Glance implementations<cr>", desc = "go to implementations" },
    ["<C-q>"] = false
  },
  v = {
    ["<M-w>"] = { "%", desc = "Go to close parent" },
  },
  t = {
    -- setting a mapping to false will disable it
    ["<Esc>"] = { "<Esc>" },
    ["<C-s>"] = { "<C-\\><C-n>", desc = "Normal mode" },
  },
  i = {
    -- ["<Tab>"] = cmp.mapping.confirm {
    --   behavior = cmp.ConfirmBehavior.Insert,
    --   select = true,
    -- },


    ["<C-s>"] = { "<c-c><c-s>" },
    ["<C-l>"] = { function() require('luasnip').jump(1) end },
    ["<C-j>"] = { function() require('luasnip').jump(-1) end },

    ["<M-j>"] = { "<Down>" },
    ["<M-h>"] = { "<Left>" },
    ["<M-l>"] = { "<Right>" },
    ["<M-k>"] = { "<Up>" },
  }
}
