return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = vim.fn.executable "make" == 1, build = "make" },
  },
  cmd = "Telescope",
  opts = function()
    local actions = require "telescope.actions"
    local get_icon = require("astronvim.utils").get_icon
    -- local fb_actions = require "telescope._extensions.file_browser.actions"
    -- lvim.builtin.telescope.defaults={
  -- use fd to "find files" and return absolute paths
	-- find_command = { "fd", "-t=f", "-a" },
	    -- path_display = { "absolute" },
        -- wrap_results = true
-- }
    return {
      pickers = {
      --   everything = { fname_width = 100,path_display = {"absolute"} },
      --   live_grep_args= { fname_width = 100,path_display = {"absolute"} },
      --   live_grep= { fname_width = 100,path_display = {"absolute"} },
      --   find_files= { fname_width = 100,path_display = {"absolute"} },
      --   current_buffer_tags = { fname_width = 100,path_display = {"absolute"} },
        jumplist = { show_line=false,path_display = {"absolute"} },
      --   loclist = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_definitions = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_document_symbols = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_dynamic_workspace_symbols = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_implementations = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_incoming_calls = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_outgoing_calls = { fname_width = 100,path_display = {"absolute"} },
        -- lsp_references = {fname_width = 100,path_display = {"absolute"}},
        lsp_references = {show_line = false,path_display = {"absolute"}},
      --   lsp_type_definitions = { fname_width = 100,path_display = {"absolute"} },
      --   lsp_workspace_symbols = { fname_width = 100,path_display = {"absolute"} },
      --   quickfix = { fname_width = 100,path_display = {"absolute"} },
      --   tags = { fname_width = 100,path_display = {"absolute"} },
      },
      defaults = {
        -- prompt_prefix = string.format("%s ", get_icon "Search"),
        selection_caret = string.format("%s ", get_icon "Selected"),
        -- path_display = { truncate = 150},
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        -- layout_strategy = "vertical",
        winblend=0,
        layout_config = {
          horizontal = {
            prompt_position = "bottom",
            preview_width = 0.40,
            mirror = true,
          },
          vertical = {
            mirror = false,
            prompt_position = "bottom",
            preview_height = 0.65,
            -- preview_width = 0.80,
          },
          width = 0.65,
          height = 0.95,
          -- preview_cutoff = 50,
        },
        file_ignore_patterns = { ".git","__pycache__" },
        mappings = {
          i = {
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
          n = { ["q"] = actions.close },
        },
      },
    }
  end,
  config = require "plugins.configs.telescope",
}
