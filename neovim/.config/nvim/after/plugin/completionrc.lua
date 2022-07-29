-- Setup lspkind.
local lspkind = require('lspkind')

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
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'cmp_tabnine' }
  },
  {
    { name = 'buffer' }
  }),
  formatting = {
    fields = { "kind", "abbr" },
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      maxwidth = 40,
      before = function(entry, vim_item)
        vim_item.kind = lspkind.presets.codicons[vim_item.kind]
        if entry.source.name == "cmp_tabnine" then
          vim_item.kind = ""
        end
        return vim_item
      end
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
