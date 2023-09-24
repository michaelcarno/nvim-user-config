return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",
  config = function()
    require("various-textobjs").setup({ useDefaultKeymaps = true })
  end,
  keys = { {
    "as",
    "<cmd>lua require('various-textobjs').subword('outer')<CR>",
    desc = "Subword",
    mode = { "x", "o" }
  },
    {
      "is",
      "<cmd>lua require('various-textobjs').subword('inner')<CR>",
      desc = "Subword",
      mode = { "x", "o" },
    },

    -- {
    --   "aS",
    --   "<cmd>lua require('various-textobjs').sentence<CR>",
    --   desc = "Subword",
    --   mode = { "x", "o" }
    -- },

    -- {"","",desc=}
    -- {"","",desc=}
  }
}
