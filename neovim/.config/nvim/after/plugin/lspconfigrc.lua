-- Setup lsp-installer.
require('nvim-lsp-installer').setup({ automatic_installation = true })

-- Setup lspconfig.
local lspconfig = require('lspconfig')

-- Mappings.
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
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

local lsp_flags = { debounce_text_changes = 150 }

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

lspconfig['jsonls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['cssls'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['html'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['tailwindcss'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['eslint'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

-- Change diagnostic symbols in the sign column (gutter).
local signs = { Error = '●', Warn = '●', Hint = '●', Info = '●' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Change prefix/character preceding the diagnostics' virtual text.
vim.diagnostic.config({ virtual_text = { prefix = '▎' } })
