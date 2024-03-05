return {
  {
    'SmiteshP/nvim-navic',
    lazy = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  {
    'hrsh7th/nvim-cmp',
    event = { 'BufEnter *.*', 'CmdlineEnter', 'VeryLazy' },
    dependencies = {
      { 'onsails/lspkind.nvim' },
      { 'hrsh7th/vim-vsnip' },
      {
        'kento-ogata/cmp-tsnip',
        dependencies = {
          'yuki-yano/tsnip.nvim'
        }
      },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'yutkat/cmp-mocword' },
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        enabled = true,
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body);
          end
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            end
          end, { 'i', 's' }),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpFloating,FloatBorder:None,CursorLine:CmpFloatingCursor,Search:None',
            col_offset = -3
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = 'Normal:CmpFloating,FloatBorder:None,Search:None',
          }),
        },
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'tsnip' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'mocword' },
        }),
        formatting = {
          expandable_indicator = true,
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            local kind = require('lspkind').cmp_format({
              mode = 'symbol_text',
              menu = {
                tsnip = 'Snippet'
              },
              maxwidth = 50,
            })(entry, vim_item)
            local strings = vim.split(kind.kind, '%s', { trimempty = true })
            if entry.source.name == 'tsnip' then
              kind.kind = ''
              kind.menu = 'Snippet'
              kind.kind_hl_group = 'CmpItemKindSnippet'
            else
              kind.kind = (strings[1] or '')
              kind.menu = (strings[2] or '')
            end
            kind.menu = '  (' .. kind.menu .. ')'
            return kind
          end,
        }
      })
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          {
            name = 'cmdline',
            option = {
              ignore_cmds = { 'Man', '!' }
            }
          }
        })
      })
    end
  }
}

