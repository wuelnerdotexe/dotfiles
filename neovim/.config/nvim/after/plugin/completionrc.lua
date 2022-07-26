-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
  }),
  sources = cmp.config.sources({
    { name = 'cmp_tabnine' },
    { name = 'vsnip' },
    { name = 'nvim_lsp' }
  },
  {
    { name = 'buffer' }
  }),
  formatting = {
    fields = { 'kind', 'abbr' },
    format = require('lspkind').cmp_format({
      preset = 'codicons',
      mode = 'symbol',
      maxwidth = 50,
    })
  }
})

-- CMP use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
  { { name = 'cmdline' } },
  { { name = 'path' } }
  )
})

-- CMP use buffer source for `/`.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})
