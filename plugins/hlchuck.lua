return {
  "shellRaining/hlchunk.nvim",
  event = "VeryLazy",
  config = function()
require('hlchunk').setup({
    indent = {
        chars = { "│", "¦", "┆", "┊", }, -- more code can be found in https://unicodeplus.com/
enable = false,
        style = {
            "#444444",
        },
    },
    blank = {
        enable = false,
    },
      line_num = {
    style = "#444444",
        enable = false
},
})
  end,
  keys ={
    { "<leader>uke", "<cmd>EnableHLChunk<cr>", desc = "Enable HLChunk"},
    { "<leader>ukd", "<cmd>DisableHLChunk<cr>", desc = "Disable HLChunk"},
    -- { "<leader>ukd", "<cmd>DisableHLChunk<cr>", desc = "Disable HLChunk"}
  }

}
