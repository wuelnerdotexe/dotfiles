-- vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
-- -----------------------------------------------------------------------------
-- Name:     languageservers.config.lua
-- Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
-- URL:      https://github.com/wuelnerdotexe/dotfiles
-- License:  MIT (C) Wuelner Martínez.
-- About:    Minimal Neovim built-in LSP config.
-- -----------------------------------------------------------------------------

-- Change diagnostic symbols in the sign column (gutter).
local signs = { Error = '●', Warn = '●', Info = '●', Hint = '●' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup diagnostics.
vim.diagnostic.config({
  virtual_text = { prefix = '▎' },
  update_in_insert = true,
  severity_sort = true
})

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
  -- Disable LSP formatting for use vim-prettier.
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Setup lspkind.
  require('lspkind').init({
    mode = 'symbol',
    preset = 'codicons',
    maxwidth = 50
  })

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

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig['jsonls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  init_options = {
    provideFormatter = false -- Disable formatter for use vim-prettier.
  }
}

lspconfig['tsserver'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['cssls'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['html'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  init_options = {
    provideFormatter = false -- Disable formatter for use vim-prettier.
  }
}

lspconfig['tailwindcss'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
}

lspconfig['eslint'].setup {
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  settings = {
    format = false -- Disable formatter for use vim-prettier.
  }
}

