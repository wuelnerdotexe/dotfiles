" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Nerd commeter setting:
filetype plugin on

" Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
" -------------------------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/vim-gitbranch'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'overcache/NeoSolarized'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'yggdroot/indentline'
Plug 'chrisbra/colorizer'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['css', 'html', 'javascript', 'json'],
  \ }

" -------------------------------------------------------
call plug#end()

" by. @wuelnermartinez