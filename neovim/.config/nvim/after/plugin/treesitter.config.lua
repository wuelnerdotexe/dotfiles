-- vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
-- -----------------------------------------------------------------------------
-- Name:     treesitter.config.lua
-- Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
-- URL:      https://github.com/wuelnerdotexe/dotfiles
-- License:  MIT (C) Wuelner Martínez.
-- About:    Minimal Neovim Tree-sitter config.
-- -----------------------------------------------------------------------------

-- Setup nvim-treesitter.
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'json',
    'jsonc',
    'css',
    'scss',
    'html',
    'javascript',
    'typescript'
  },
  sync_install = true,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = { enable = true },
  context_commentstring = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true }
}

