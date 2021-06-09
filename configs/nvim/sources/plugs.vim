" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Nerd commeter setting:
filetype plugin on

" Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
" -------------------------------------------------------
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'overcache/NeoSolarized'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'chrisbra/colorizer'

" -------------------------------------------------------
call plug#end()

" by. @wuelnermartinez