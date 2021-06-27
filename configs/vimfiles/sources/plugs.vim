" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Plug settings:
filetype plugin on

" Vim plugs installeds:
call plug#begin('~/vimfiles/plugged')
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

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'ghifarit53/tokyonight-vim'
" -------------------------------------------------------
call plug#end()

" by. @wuelnermartinez
