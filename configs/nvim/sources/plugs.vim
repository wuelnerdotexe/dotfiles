" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Nerd commeter setting:
filetype plugin on

" Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
" -------------------------------------------------------
Plug 'itchyny/lightline.vim' |
            \ Plug 'itchyny/vim-gitbranch' |
            \ Plug 'maximbaz/lightline-ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'chrisbra/colorizer'

Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'scrooloose/nerdtree-project-plugin' |
            \ Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'preservim/nerdcommenter'
" -------------------------------------------------------
call plug#end()

" Nvim plugs desactivated:
" Plug 'overcache/NeoSolarized'

" by. @wuelnermartinez