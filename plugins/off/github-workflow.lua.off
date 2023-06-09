return {
  "topaxi/gh-actions.nvim",
  build = 'make',
  dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
  event = "VeryLazy",
  cmd = 'GhActions',
  config = function(_, opts)
    require('gh-actions').setup(opts)
  end,
  keys = {
    { '<leader>ga', '<cmd>GhActions<cr>', desc = 'Open Github Actions' },
  },
}
