-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    relativenumber = true,     -- sets vim.opt.relativenumber
    number = true,             -- sets vim.opt.number
    spell = false,             -- sets vim.opt.spell
    signcolumn = "auto",       -- sets vim.opt.signcolumn to auto
    wrap = false,              -- sets vim.opt.wrap
    showtabline = 0,           -- always display tabline
    scrolloff = 10,            -- Number of lines to keep above and below the cursor
    foldenable = true,         -- enable fold for nvim-ufo
    foldlevel = 99,            -- set high foldlevel for nvim-ufo
    foldlevelstart = 99,       -- start with all code unfolded
    foldcolumn = "0",          -- vim.fn.has "nvim-0.9" == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
    fillchars = { eob = "~" }, -- disable `~` on nonexistent lines
  },
  g = {
    highlighturl_enabled = false,                    -- highlight URLs by default
    mapleader = " ",                                 -- sets vim.g.mapleader
    autoformat_enabled = true,                       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true,                              -- enable completion at start
    autopairs_enabled = true,                        -- enable autopairs at start
    diagnostics_mode = 3,                            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,                            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true,                 -- disable notifications when toggling UI elements
    max_file = { size = 1024 * 100, lines = 10000 }, -- set global limits for large files
    inlay_hints_enabled = true,                      -- enable or disable LSP inlay hints on startup (Neovim v0.10 only)
    semantic_tokens_enabled = true,                  -- enable or disable LSP semantic tokens on startup
  },
}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
