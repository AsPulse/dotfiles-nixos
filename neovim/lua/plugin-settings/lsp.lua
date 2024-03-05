return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    lazy = true,
    ft = { 'rust' },
    dependencies = {
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
    },
    init = function()
      -- Rust
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
              buffer = bufnr,
              callback = function()
                if vim.fn.exists(':RustFmt') > 0 then
                  vim.cmd([[RustFmt]])
                else
                  print('rustfmt not found')
                end
              end
            })
          end,
          default_settings = {
            ["rust-analyzer"] = {
              check = {
                command = 'clippy'
              },
              lens = {
                enable = true
              },
              assist = {
                importGranularity = "module",
                importPrefix = "self",
              },
              cargo = {
                loadOutDirsFromCheck = true
              },
              procMacro = {
                enable = true
              },
              checkOnSave = true,
            }
          },
        }
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufEnter *.*', 'VeryLazy' },
    dependencies = {
      'jose-elias-alvarez/null-ls.nvim',
      'nvim-lua/plenary.nvim',
      'nvimdev/lspsaga.nvim',
      'SmiteshP/nvim-navic',
      'simrat39/rust-tools.nvim',
      'b0o/schemastore.nvim',
    },
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.editorconfig_checker
        }
      })

      local lspconfig = require('lspconfig')

      -- Dockerls
      lspconfig.dockerls.setup {}

      -- Lua Language Server
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
              pathStrict = true,
              path = { "?.lua", "?/init.lua" },
            },
            workspace = {
              library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
                "${3rd}/luv/library",
                "${3rd}/busted/library",
                "${3rd}/luassert/library",
              }),
              checkThirdParty = "Disable",
            },
          },
        },
      })

      -- jsonls
      lspconfig.jsonls.setup {
        filetypes = { "json", "jsonc", "jsonl", "json5" },
        settings = {
          json = {
          schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          }
        }
      }

      -- yamlls
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require('schemastore').yaml.schemas(),
          }
        }
      }

      -- LspAttach Setup
      local navic = require('nvim-navic')
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client == nil then
            print('No client found on LspAttach. (lsp.lua)');
            return
          end
          if client.server_capabilities.documentSymbolProvider then
            navic.attach(client, event.buf)
          end
          local bufopts = { noremap = true, silent = true, buffer = event.buf }
          vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, bufopts)
          vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end
      })

    end
  },
  {
    'nvimdev/lspsaga.nvim',
    event = { 'BufEnter *.*' },
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function ()
      require('lspsaga').setup({
        ui = {
          border = 'rounded',
        }
      })
      vim.keymap.set('n', '<leader>rn', function() vim.api.nvim_command('Lspsaga rename') end, {})
      vim.keymap.set('n', '<leader>ac', function() vim.api.nvim_command('Lspsaga code_action') end, {})
      vim.keymap.set('n', 'K', function() vim.api.nvim_command('Lspsaga hover_doc') end, {})
    end
  },
  {
    'stevearc/dressing.nvim',
    event = 'BufEnter *.*',
    config = function ()
      require('dressing').setup()
    end
  },
  {
    'folke/lsp-colors.nvim',
    event = 'BufEnter *.*',
  },
}
