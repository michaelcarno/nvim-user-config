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
  colorscheme = "mctheme",
  -- colorscheme = "astrotheme",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- setup_handlers = {
    --   -- add custom handler
    --   tsserver = function(_, opts) require("typescript-tools").setup { server = opts } end
      -- ngserver = function(_,opts) require()end
    -- },

    -- customize lsp formatting options
    formatting = {

      -- filter = function(client)
      --   if vim.bo.filetype == "angular" then
      --       return client.name == "null-ls"
      -- end
      -- return true
      -- end,
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
        "html" ,    -- eslint do it better that html-lsp (it doesnt read editorconfig)
        -- "tsserver"
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
    config = {
      angularls = {
        -- filetypes = {"angular"}
        filetypes = {"angular","typescript", "html",
          "typescriptreact" ,"typescript.tsx"}
      }
    }
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
  plugins = { {
    "akinsho/toggleterm.nvim",
    opts = {
      float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        width = 160,
        height = 200,
        -- winblend = 3,
        -- zindex =,
      },
    }
  }

    -- "pmizio/typescript-tools.nvim", -- add lsp plugin
    -- {
    --   "williamboman/mason-lspconfig.nvim",
    --   opts = {
    --     ensure_installed = { "tsserver" }, -- automatically install lsp
    --   },
    -- },
    --
    -- cmp = function(opts)
    --   local cmp = require "cmp"
    --   -- modify the mapping part of the table
    --   opts.mapping["<Tab>"] = cmp.mapping.confirm {
    --     behavior = cmp.ConfirmBehavior.Insert,
    --     select = true,
    --   }
    --   return opts
    -- end

  },
  polish = function()
    -- REFACTOR or DELETE after  it will be fixed in 0.10 https://github.com/nvim-telescope/telescope.nvim/issues/2027
    -- vim.api.nvim_create_autocmd("WinLeave", {
    --   callback = function()
    --     if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
    --       vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    --     end
    --   end,
    -- })
    --
    -- turn off semantic tokens (break hightlight in TS mb on other languges too)
    -- mb should turn it on after fix
    -- require('lspconfig').graphql.setup({
    --   on_attach = function(client)
    --     client.server_capabilities.workspaceSymbolProvider = false
    --   end,
    --   filetypes = {
    --     "graphql",
    --     "typescriptreact",
    --     "typescript",
    --     "javascript",
    --     "javascriptreact"
    --   }
    -- })
    --
    --
    -- vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"
vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          vim.fn.timer_start(100, function()
            vim.cmd('set title')
            vim.cmd('set titlestring=%F')
          end)
        end,
      })
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

    parser_config.teraonline_definitions = {
      install_info = {
        url = "D://pinki//backstep//treesitter-teradefinition", -- local path or git repo
        files = { "src/parser.c" },                             -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main",                                        -- default branch in case of git repo if different from master
        generate_requires_npm = false,                          -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false,                 -- if folder contains pre-generated src/parser.c
      },
      filetype = "def",                                         -- if filetype does not match the parser name
    }
    --
    -- также надо добавить filetype.vim с содержимым 
    -- autocmd BufRead,BufEnter *.component.html set filetype=angular
    -- C:\Users\michaelcarno\AppData\Local\nvim-data\lazy\nvim-treesitter-angular\ftdetect
    parser_config.angular2 = {
      install_info = {
        url = "D:\\angular17tree\\tree-sitter-angular", -- local path or git repo
        files = { "src/parser.c", "src/scanner.c" },                             -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "feature/control-flows",                                        -- default branch in case of git repo if different from master
        generate_requires_npm = false,                          -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = true,                 -- if folder contains pre-generated src/parser.c
      }

    }

    if next(vim.fn.argv()) == nil then
      vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
          vim.fn.timer_start(100, function()
            vim.cmd('SessionManager load_session')
          end)
        end,
      });
    end
    vim.fn.timer_start(100, function()
      vim.cmd('set keymap=russian-jcukenwin')
      vim.cmd('set iminsert=0')
      vim.cmd('set imsearch=0')
      vim.cmd('set laststatus=2')
    end)

    require("notify").setup({
      background_colour = "NotifyBackground",
      fps = 1,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 50,
      render = "default",
      stages = "static",
      timeout = 5000,
      top_down = true,
      max_width = nil,
      max_height = nil,
      on_open = nil,
      on_close = nil
    })
    -- lsp_mappings.n["<leader>lG"][1] = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end
    -- grep with args plugin
    local telescope = require("telescope")
    local lga_actions = require("telescope-live-grep-args.actions")

    telescope.setup {
      extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {         -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
          -- ... also accepts theme settings, for example:
          -- theme = "dropdown", -- use dropdown theme
          -- theme = { }, -- use own theme spec
          -- layout_config = { mirror=true }, -- mirror preview pane
        }
      }
    }

    vim.g.firenvim_config = {
      globalSettings = { alt = "all" },
      localSettings = {
        [".*"] = {
          cmdline  = "neovim",
          content  = "text",
          priority = 1,
          selector = "",
          takeover = "never"
        }
      }
    }


    if vim.g.started_by_firenvim == true then
      -- vim.api.nvim_create_autocmd('UIEnter', {
      --   pattern = "*",
      --   cmd = "set guifont=JetBrainsMono NFP:h15"
      -- })
      vim.g.icons_enabled = false
      vim.api.nvim_create_autocmd("UIEnter", {
        callback = function()
          vim.fn.timer_start(100, function()
            vim.opt.lines = 15
            vim.cmd('set guifont=JetBrainsMono:h15')
          end)
        end,
      })
      vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = "github.com_*.txt",
        cmd = "set filetype=markdown"
      })
      -- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
      --   pattern = "*.txt",
      --   cmd = "set filetype=html"
      -- })
    end

    vim.api.nvim_exec('language en_US', true)
    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     client.server_capabilities.semanticTokensProvider = nil
    --   end,
    -- });

    require 'nvim-treesitter.install'.compilers = { "clang" }
    -- require 'nvim-treesitter.install'.compilers = { "clang" }
    -- require('lspconfig').tsserver.setup({})
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
   vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    -- local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    -- vim.g['dotnet_last_proj_path'] = path
    local msbuildPatch ="\"D:/Program Files/Microsoft Visual Studio/2022/Enterprise/MSBuild/Current/Bin/msbuild.exe\""
    -- local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    local solution = vim.fn.input('Name solution file: ')
    local cmd =msbuildPatch.." "..solution..".sln  /p:Configuration=Debug /l:FileLogger,Microsoft.Build.Engine;logfile=Manual_MSBuild_DebugVersion_LOG.log"
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        if vim.g['dotnet_last_dll_path'] ~= nim then
          return  vim.fn.input('Path to dll ', vim.g['dotnet_last_dll_path'] )
        end

        return vim.fn.input('Path to dll ', vim.fn.getcwd() .. '/bin/Debug/net8-windows/win-x64/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end -- lsp_mappings.n["<leader>lG"][1] = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end

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
