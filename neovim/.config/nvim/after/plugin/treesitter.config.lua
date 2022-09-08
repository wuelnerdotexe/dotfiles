-- vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
-- -----------------------------------------------------------------------------
-- Name:     treesitter.config.lua
-- Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
-- URL:      https://github.com/wuelnerdotexe/dotfiles
-- License:  MIT (C) Wuelner Martínez.
-- About:    Minimal Neovim Tree-sitter config.
-- -----------------------------------------------------------------------------

-- Setup nvim-treesitter.
require('nvim-treesitter.configs').setup({
  ensure_installed = 'comment',
  sync_install = true,
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true },
  rainbow = { enable = true, extended_mode = false, max_file_lines = nil },
  context_commentstring = {
    enable = true,
    commentary_integration = { Commentary = 'g/', CommentaryLine = false }
  },
  autotag = { enable = true },
  matchup = { enable = true }
})

-- Setup indent-blankline.
require('indent_blankline').setup({
  char_list = {
    '|', '¦', '┆', '┊', '│',
    '│', '│', '│', '│', '│',
  },
  use_treesitter = true,
  show_trailing_blankline_indent = false,
  bufname_exclude = { '' },
  filetype_exclude = {
    'checkhealth',
    'fern',
    'fugitive',
    'help',
    'lspinfo',
    'man',
    'mason',
    'null-ls-info',
    'startify',
    ''
  }
})

-- Setup autopairs.
require('nvim-autopairs').setup({ check_ts = true })

-- Setup illuminate.
require('illuminate').configure({
  filetypes_denylist = {
    'checkhealth',
    'fern',
    'fugitive',
    'help',
    'lspinfo',
    'man',
    'mason',
    'null-ls-info',
    'startify',
    ''
  }
})

