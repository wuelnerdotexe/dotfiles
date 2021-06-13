" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Plug settings:
filetype plugin on

" Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
" -------------------------------------------------------
Plug 'itchyny/lightline.vim' |
            \ Plug 'maximbaz/lightline-ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'chrisbra/colorizer'

Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

Plug 'preservim/nerdtree' |
            \ Plug 'scrooloose/nerdtree-project-plugin' |
            \ Plug 'PhilRunninger/nerdtree-visual-selection'

Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
" -------------------------------------------------------
call plug#end()

" Nvim plugs desactivated:
" Plug 'overcache/NeoSolarized'

" by. @wuelnermartinez