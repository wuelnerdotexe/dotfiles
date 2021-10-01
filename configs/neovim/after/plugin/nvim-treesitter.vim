" -----------------------------------------------------------------------------
" Name:     nvim_treesitter.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    After config file for nvim-treesitter plugin.
" -----------------------------------------------------------------------------

if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded nvim-treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "html", "css", "javascript", "json", "typescript", "tsx" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
