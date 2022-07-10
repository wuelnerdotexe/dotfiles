" -----------------------------------------------------------------------------
" Name:     MYNVIMRC
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal neovim config.
" -----------------------------------------------------------------------------

" The script ends if nvimrc is not initialized.
if !exists('g:nvimrc') || g:nvimrc == 0
  finish
endif

" Nvim interfaz.
set signcolumn=yes:2

" Nvim interaction.
set complete= omnifunc=                        " Disabled for best performance.

lua <<EOF
-- CMP init.
local cmp = require('cmp')

-- LSP init.
local lspconfig = require('lspconfig')
-- ----------------------------------------------------------------------------
-- SECTION: Nvim plugins mappings.
-- ----------------------------------------------------------------------------
-- CMP mappings.
local mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true })
})

-- LSP global maps.
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- LSP buffer maps.
local on_attach = function(client, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end
-- ----------------------------------------------------------------------------
-- SECTION: Nvim plugins configs.
-- ----------------------------------------------------------------------------
-- Tree-sitter setup.
require'nvim-treesitter.configs'.setup {
  highlight = {
    ensure_installed = {
      "html",
      "json",
      "jsonc",
      "javascript",
      "typescript",
      "css",
      "scss"
    },
    sync_install = false,
    auto_install = true,
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = { enable = false },
  rainbow = { enable = true, extended_mode = false, max_file_lines = nil },
  autotag = { enable = true },
  context_commentstring = { enable = true },
  matchup = { enable = true }
}

-- CMP setup.
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = mapping,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'nvim_lsp_signature_help' }
  },
  {
    { name = 'buffer' }
  }),
  formatting = {
    format = function(entry, vim_item)
      local kind_icons = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = ""
      }

      vim_item.kind = string.format(
        '%s %s',
        kind_icons[vim_item.kind],
        vim_item.kind
      )
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        vsnip = "[Snippet]"
      })[entry.source.name]
      return vim_item
    end
  },
  experimental = { ghost_text = false } -- Copilot integration.
})

-- CMP use buffer source for `/`.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})

-- CMP use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
  { { name = 'path' } },
  { { name = 'cmdline' } }
  )
})

-- CMP capabilities for nvim_lsp.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- CMP enable snippets support.
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP & lspconfig setup.
local lsp_flags = { debounce_text_changes = 150 }

-- LSP config for jsonls.
lspconfig['jsonls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- LSP config for tsserver.
lspconfig['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- LSP config for cssls.
lspconfig['cssls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- LSP config for html.
lspconfig['html'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- LSP config for tailwindcss.
lspconfig['tailwindcss'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- LSP config for eslint.
lspconfig['eslint'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}
EOF

" Airline add nvim extensions.
let g:airline_extensions+=['nvimlsp']

" Enfocado add nvim plugins.
let g:enfocado_plugins+=['cmp', 'copilot', 'lsp', 'treesitter']
