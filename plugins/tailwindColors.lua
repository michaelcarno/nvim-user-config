local utils = require "astronvim.utils"

return {
  "themaxmarchuk/tailwindcss-colors.nvim",
  event = "VeryLazy",
  config = function()
    local nvim_lsp = require("lspconfig")

    local on_attach = function(client, bufnr)
      require("tailwindcss-colors").buf_attach(bufnr)
    end
    nvim_lsp["tailwindcss"].setup({
      -- other settings --
      on_attach = on_attach,
    })
  end,


  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, "css")
      end
    end,

  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "tailwindcss", "cssls" })
    end,

  },

  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed, { "rustywind" })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "js-everts/cmp-tailwind-colors", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        if item.kind == "Color" then
          item = require("cmp-tailwind-colors").format(entry, item)

          return item
        end

        return format_kinds(entry, item)
      end
    end,

  },

  {
    "NvChad/nvim-colorizer.lua",

    opts = {
      user_default_options = {
        names = true,

        tailwind = true,

      },

    },

  },

}
