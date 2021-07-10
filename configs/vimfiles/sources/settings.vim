" FILE CONFIG SETTINGS.VIM FOR VIM GENERAL AJUSTS.

" Disabling Neovim providers: 
let g:loaded_python_provider=0
let g:loaded_python3_provider=0
let g:loaded_node_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

" Vim performance settings:
set hidden
set ttyfast
set lazyredraw
set updatetime=100

" Files management settings:
set nobackup
set nowritebackup
set undofile
set undodir=$TEMP\nvim-undodir\

" Vim interaction settings:
set backspace=
set clipboard=unnamed
set mouse=a

" Vim interfaz settings:
set notitle
set signcolumn=auto
set relativenumber
set cursorline
set cmdheight=1
set laststatus=2
set ruler
set splitright
set splitbelow

" Vim encoding settings:
set encoding=utf-8
filetype on
filetype indent on
filetype plugin on

" Vim coding settings:
set nowrap
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set smartindent
set autoindent
set shiftround
set showmatch

" Vim search settings:
set ignorecase
set incsearch
set hlsearch

" by. @wuelnermartinez
