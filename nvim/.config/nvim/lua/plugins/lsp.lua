return {
  "neovim/nvim-lspconfig",
  opts = {},
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp", -- lsp-config completion
    "hrsh7th/cmp-buffer", -- vim buffer completion
    "mason-org/mason.nvim",
    {"mason-org/mason-lspconfig.nvim", -- package manager for lsp servers
      dependencies = {"mason-org/mason.nvim",}
    },
    "onsails/lspkind.nvim", -- LSP Auto Complete Formatting + Symbols
  },
  config = function ()
    -- Reserve a space in the gutter
    vim.opt.signcolumn = 'yes'

    -- # LSP Keybinds
    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = {buffer = event.buf}
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end,
    })

    -- # Auto Completions
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local select_opts = { behavior = cmp.SelectBehavior.Select }
    vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
    cmp.setup {

      -- # Enable sources for auto completion (LSP, File Paths, Buffer Text)
      sources = {
        { name = 'path'},
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      },

      window = {
        documentation = cmp.config.window.bordered()
      },

      -- # Enable lspkind formatting
      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          menu = ({
            nvim_lsp = "[LSP]",
            ultisnips = "[US]",
            nvim_lua = "[Lua]",
            path = "[Path]",
            buffer = "[Buffer]",
            emoji = "[Emoji]",
              omni = "[Omni]",
          }),
        }),
      },

      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        -- scroll up and down the documentation window
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        -- Tab Cycling
        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col('.') - 1

          if cmp.visible() then
            cmp.select_next_item({behavior = 'select'})
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
            fallback()
          else
            cmp.complete()
          end
        end, {'i', 's'}),

        -- Go to previous item
        ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
      }),
    }

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    local lspconfig_defaults = require('lspconfig').util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      'force',
      lspconfig_defaults.capabilities,
      require('cmp_nvim_lsp').default_capabilities()
    )

    -- # mason-lspconfig
    -- enable sever autostart IFF server is MasonInstall'd
    -- Language Server Config List:
    --  https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright", "biome", "lua_ls"
      },
      automatic_enable = true,
      handlers = {

        -- auto enable lsp server handler
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        lua_ls = function ()
           vim.lsp.config('lua_ls', {
            on_init = function(client)
              if client.workspace_folders then
                local path = client.workspace_folders[1].name
                if
                  path ~= vim.fn.stdpath('config')
                  and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                then
                  return
                end
              end
              client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                runtime = {
                  -- Tell the language server which version of Lua you're using (most
                  -- likely LuaJIT in the case of Neovim)
                  version = 'LuaJIT',
                  -- Tell the language server how to find Lua modules same way as Neovim
                  -- (see `:h lua-module-load`)
                  path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                  },
                },
                -- Make the server aware of Neovim runtime files
                workspace = {
                  checkThirdParty = false,
                  library = {
                    vim.env.VIMRUNTIME,
                    -- Depending on the usage, you might want to add additional paths
                    -- here.
                    -- '${3rd}/luv/library',
                    -- '${3rd}/busted/library',
                  },
                  -- Or pull in all of 'runtimepath'.
                  -- NOTE: this is a lot slower and will cause issues when working on
                  -- your own configuration.
                  -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                  -- library = vim.api.nvim_get_runtime_file('', true),
                },
              })
            end,

            settings = {
              Lua = {},
            },
          })

        end,
      }
    })
    -- # lspconfig diagnostice Popups (Warning, Errors)
    vim.diagnostic.config({
      virtual_text = false
    })

    -- Show line diagnostics automatically in hover window
    vim.o.updatetime = 250
    vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


  end,
}

