"FILE CONFIG GINIT.VIM FOR NVIM-QT by. @wuelnermartinez

"Nvim-qt interfaz settings:
GuiFont MesloLGSDZ NF:h14:b
set number relativenumber
set cursorline
set laststatus=2

"Nvim-qt coding settings:
set encoding=utf-8
syntax on
set autoindent
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set nowrap

"Nvim-qt search settings:
set hlsearch
set ignorecase
set incsearch

"Nvim-qt plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
"-------------------------------------------------
Plug 'itchyny/lightline.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
"Plug 'lifepillar/vim-solarized8'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'townk/vim-autoclose'
Plug 'yggdroot/indentline'
Plug 'chrisbra/colorizer'
"-------------------------------------------------
call plug#end()

"Plug interface settings:
colorscheme nord
let g:lightline = { 'colorscheme': 'nord' }