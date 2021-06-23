" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Plug settings:
filetype plugin on

" Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
" -------------------------------------------------------
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim' |
			\ Plug 'mengelbrecht/lightline-bufferline' |
            \ Plug 'maximbaz/lightline-ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

Plug 'tpope/vim-commentary'

Plug 'mhinz/vim-signify'

Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
" -------------------------------------------------------
call plug#end()

" Nvim plugs desactivated:
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'overcache/NeoSolarized'
" Plug 'folke/tokyonight.nvim'

" by. @wuelnermartinez
