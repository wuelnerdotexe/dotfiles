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
}

-- Setup indent-blankline.
require('indent_blankline').setup {
  bufname_exclude = { '' },
  use_treesitter = true,
  show_current_context = true
}

