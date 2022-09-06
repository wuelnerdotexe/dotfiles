-- vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
-- -----------------------------------------------------------------------------
-- Name:     languageservers.config.lua
-- Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
-- URL:      https://github.com/wuelnerdotexe/dotfiles
-- License:  MIT (C) Wuelner Martínez.
-- About:    Minimal Neovim built-in LSP config.
-- -----------------------------------------------------------------------------

-- Setup mason.
require('mason').setup()

-- Setup mason-lspconfig.
require('mason-lspconfig').setup({ automatic_installation = true })

-- Setup cmp-nvim-lsp.
local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Flags.
local lsp_flags = { debounce_text_changes = 150 }

-- Global mappings.
local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Disable LSP formatting for use only null-ls.
  if client.name ~= 'null-ls' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  else
    -- Avoiding LSP formatting conflicts.
    local lsp_formatting = function(bufnr)
      vim.lsp.buf.format({ filter = function(client)
        return client.name == 'null-ls'
      end, bufnr = bufnr })
    end

    -- Enable sync formatting on save.
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
          -- On < 0.8, you should use vim.lsp.buf.formatting_sync() instead.
        end
      })
    end
  end

  -- Sever mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  if client.name == 'eslint' then
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  elseif client.name ~= 'tailwindcss' and client.name ~= 'tailwindcss' then
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
end

-- Setup lspconfig.
local lspconfig = require('lspconfig')

lspconfig['jsonls'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  -- Disable formatter for use only null-ls.
  init_options = { provideFormatter = false }
})

lspconfig['tsserver'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
})

lspconfig['cssls'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
})

lspconfig['html'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  -- Disable formatter for use only null-ls.
  init_options = { provideFormatter = false }
})

lspconfig['emmet_ls'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
})

lspconfig['tailwindcss'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities
})

lspconfig['eslint'].setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  -- Disable formatter for use only null-ls.
  settings = { format = false }
})

-- Setup null-ls.
local null_ls = require('null-ls')

null_ls.setup({
  on_attach = on_attach,
  sources = {
    null_ls.builtins.formatting.prettierd.with({
      condition = function(utils)
        return utils.root_has_file({
          '.prettierrc',
          '.prettierrc.json',
          '.prettierrc.yaml',
          '.prettierrc.yml',
          '.prettierrc.json5',
          '.prettierrc.js',
          '.prettierrc.cjs',
          'prettier.config.js',
          'prettier.config.cjs',
          '.prettierrc.toml',
        })
      end
    })
  },
  update_in_insert = false
})

-- Change diagnostic symbols in the sign column (gutter).
local signs = { Error = '●', Warn = '●', Info = '●', Hint = '●' }

for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type

  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Setup diagnostics.
vim.diagnostic.config({
  virtual_text = { prefix = '▎' },
  float = { source = 'always' },
  update_in_insert = true,
  severity_sort = true
})

