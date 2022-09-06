-- vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
-- -----------------------------------------------------------------------------
-- Name:     autocomplete.config.lua
-- Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
-- URL:      https://github.com/wuelnerdotexe/dotfiles
-- License:  MIT (C) Wuelner Martínez.
-- About:    Minimal Neovim auto-completion config.
-- -----------------------------------------------------------------------------

-- Disable Neovim completion.
vim.opt.omnifunc = '' -- Omnifunction.
vim.opt.complete = '' -- Neovim native.

-- Require modules.
local cmp = require('cmp')
local lspkind = require('lspkind')

-- Super-Tab like mapping with vim-vsnip.
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(
    0, line - 1, line, true
  )[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(key, true, true, true), mode, true
  )
end

-- Exclude filetypes.
cmp.setup.filetype({
  'checkhealth',
  'fern',
  'fugitive',
  'help',
  'lspinfo',
  'man',
  'mason',
  'null-ls-info',
  'startify',
  'text',
  ''
}, { enabled = false })

-- Setup cmp.
cmp.setup({
  snippet = { expand = function(args)
    vim.fn['vsnip#anonymous'](args.body)
  end },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-3),
    ['<C-f>'] = cmp.mapping.scroll_docs(3),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        feedkey('<Plug>(vsnip-jump-prev)', '')
      end
    end, { 'i', 's' })
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'cmp_tabnine' }
  }, { name = 'buffer' }),
  formatting = {
    fields = { 'abbr', 'kind' },
    -- Setup lspkind.
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      before = function(entry, vim_item)
        vim_item.kind = string.format(
          '%s %s',
          lspkind.presets.codicons[vim_item.kind],
          vim_item.kind
        )

        if entry.source.name == 'cmp_tabnine' then
          vim_item.kind = string.format('%s %s', '', 'Tabnine')
        end

        return vim_item
      end
    })
  }
})

-- Setup autopairs for cmp.
cmp.event:on('confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)

