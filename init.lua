return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = false,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 3000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen"
        },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  plugins = {

  },
  polish = function()
    -- turn off semantic tokens (break hightlight in TS mb on other languges too)
    -- mb should turn it on after fix
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    });

    require 'nvim-treesitter.install'.compilers = { "clang" }
    -- require('lspconfig').tsserver.setup {
    --   -- init_options = {
    --   --   preferences = {
    --   --     disableSuggestions = true
    --   --   }
    --   -- },
    --   filetypes = {
    --     'typescript',
    --     'typescriptreact',
    --     'typescript.tsx',
    --   },
    -- }
    -- fixing clangd bug with notification spam
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.offsetEncoding = { "utf-16" }

    require("lspconfig").clangd.setup({ capabilities = capabilities })
    require("notify").setup({
      stages = 'static'
    })
    -- lsp_mappings.n["<leader>lG"][1] = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end

    -- vim.keymap.set("n", "<leader>lG", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    --   { desc = "Search global symbol" })


    -- cmp customizing
    -- vscode icons style
    -- local cmp_kinds = {
    --   Text = '  ',
    --   Method = '  ',
    --   Function = '  ',
    --   Constructor = '  ',
    --   Field = '  ',
    --   Variable = '  ',
    --   Class = '  ',
    --   Interface = '  ',
    --   Module = '  ',
    --   Property = '  ',
    --   Unit = '  ',
    --   Value = '  ',
    --   Enum = '  ',
    --   Keyword = '  ',
    --   Snippet = '  ',
    --   Color = '  ',
    --   File = '  ',
    --   Reference = '  ',
    --   Folder = '  ',
    --   EnumMember = '  ',
    --   Constant = '  ',
    --   Struct = '  ',
    --   Event = '  ',
    --   Operator = '  ',
    --   TypeParameter = '  ',
    -- }
    -- require("cmp").setup({
    --   window = {
    --     completion = {
    --       winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
    --       col_offset = -3,
    --       side_padding = 0,
    --     },
    --   },
    --   formatting = {
    --     fields = { "kind", "abbr", "menu" },
    --     format = function(entry, vim_item)
    --       local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
    --       local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --       kind.kind = " " .. (strings[1] or "") .. " "
    --       kind.menu = "    (" .. (strings[2] or "") .. ")"
    --
    --       return kind
    --     end,
    --   },
    -- })
    -- dap.adapters.chrome = {
    --   type = "executable",
    --   command = "node",
    --   args = {
    --     "C:\\Users\\michaelcarno\\AppData\\Local\\nvim-data\\mason\\packages\\chrome-debug-adapter\\out\\src\\chromeDebug.js",
    --     "45635" }
    -- }
    --
    -- dap.configurations.javascript = {
    --   {
    --     type = "chrome",
    --     request = "attach",
    --     program = "${file}",
    --     -- debugServer = 45635,
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     protocol = "inspector",
    --     port = 9222,
    --     webRoot = "${workspaceFolder}",
    --   }
    -- }
    -- dap.configurations.typescript = {
    --   {
    --     type = "chrome",
    --     request = "attach",
    --     program = "${file}",
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     -- debugServer = 45635,
    --     protocol = "inspector",
    --     port = 9222,
    --     webRoot = "${workspaceFolder}",
    --   },
    -- }
    --
    -- vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    -- command to build treesiter  (have to install LLVM)
    --cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build
  end,
}
