" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Plug settings:
filetype plugin on

" Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
" -------------------------------------------------------
Plug 'preservim/nerdtree' |
            \ Plug 'scrooloose/nerdtree-project-plugin'

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
" Plug 'overcache/NeoSolarized'

" by. @wuelnermartinez
