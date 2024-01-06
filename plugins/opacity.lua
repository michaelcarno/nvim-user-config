return {
  "xiyaowong/transparent.nvim",
  event = "VeryLazy",
  config = function()
    require("transparent").setup({
      groups = { -- table: default groups
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
        "NeoTreeDirectoryIcon",
        "NeoTreeRootName",
        "NeoTreeFileName",
        "NeoTreeFileIcon",
        "NeoTreeFileNameOpened",
        "NeoTreeIndentMarker",
        "NeoTreeGitAdded",
        "NeoTreeGitConflict",
        "NeoTreeGitModified",
        "NeoTreeGitUntracked",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeSymbolicLinkTarget",
        "StatusLine",
        "NormalFloat",
        "WinBar",
        "WinBarNC",
        -- "TelescopePreviewLine",
        "TelescopeNormal",
        "TelescopePromptNormal",
        "TelescopePreviewNormal",
        "TelescopeNormal",
        "TelescopeResultsNormal",
      },
      extra_groups = {},   -- table: additional groups that should be cleared
      exclude_groups = {}, -- table: groups you don't want to clear
    })
  end,
  keys = {
    { "<leader>uo", "<cmd>TransparentToggle<cr>", desc = "Transparent toggle" }
  }
}
