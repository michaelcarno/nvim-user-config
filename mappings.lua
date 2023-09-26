-- Mapping data with "desc" stored directly by vim.keymap.set().
local utils = require "astronvim.utils"
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"]  = { name = "Buffers" },
    ["<leader>h"]  = false, -- remove home screen hotkey
    ["gh"]         = { "_", desc = "First symbols of current line" },
    ["go"]         = { "$", desc = "Last symbol of line" },
    -- ["<M-w>"]      = { "g%", desc = "Go to close parent" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["F2"]         = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- version b4 fix
    -- ["<leader>lG"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Search symbol globaly" },
    ["<leader>gn"] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame for all lines" },
    ["<leader>bC"] = { "<cmd>%bd<cr>", desc = "Close all buffer" },
    ["<leader>ft"] = { "<cmd>Trouble<cr>", desc = "Find trouble" },
    ["<leader>tm"] = { function() utils.toggle_term_cmd "btm" end, desc = "ToggleTerm btm" },
    ["<leader>fT"] =
    { function()
      require(
        "telescope.builtin"
      ).colorscheme { enable_preview = true }
    end, desc = "Find themes" },

    ["<leader>R"]  = { "<Plug>RestNvim", desc = "Run RestRequest" },
    -- ["<leader>gm"] = { "<cmd>Himalaya bondarenkoma<cr>", desc = "Check email bondarenkoma" },
    -- ["<C-k>"]      = { function()
    --   require('lsp_signature').toggle_float_win()
    -- end, desc = "Toggle signature" },
  },
  v = {
    ["<M-w>"] = { "%", desc = "Go to close parent" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-[>"] = { "<C-\\><C-n>", desc = "Normal mode" }
  },
}
