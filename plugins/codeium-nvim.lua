return {

  -- {
  --     "hrsh7th/nvim-cmp",
  --     dependencies = {
  --         { "Exafunction/codeium.nvim", "nvim-lua/plenary.nvim" },
  --         opts = function(_, opts)
  --             local format_kinds = opts.formatting.format
  --             opts.formatting.format = function(entry, item)
  --                 if item.kind == "Codeium" then
  --                     return require('lspkind').cmp_format({
  --                         mode = "symbol",
  --                         maxwidth = 50,
  --                         ellipsis_char = '...',
  --                         symbol_map = { Codeium = "", }
  --                     })
  --                 end
  --             end
  --         end
  --     }
  -- },
  {
    "Exafunction/codeium.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "BufEnter",
    config = function()
      require("codeium").setup({
        bin_path = "D:\\langserver\\",
      })
    end
  } }
