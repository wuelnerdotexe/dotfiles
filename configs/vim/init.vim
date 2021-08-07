" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.
" -----------------------------------------------------------------------------
" NOTE: All options, settings, files and their imports are extremely ordered
" line by line to optimize Vim / Neovim boot performance to the maximum.
" -----------------------------------------------------------------------------

" Setting required to set custom option values in vim.
set nocompatible

" Vim encoding option values.
set encoding=utf-8

" Vim syntax and filetype option values.
syntax on
filetype on
filetype indent on
filetype plugin on

" Files management option values.
set nobackup
set nowritebackup
set undofile
set undodir=$TEMP\undofiles\

" Vim performance option values.
set hidden
set ttyfast
set lazyredraw
set updatetime=100

" Vim interaction option values.
set backspace=
set clipboard=unnamed
set mouse=a

" Vim interfaz option values.
set notitle
set signcolumn=yes
set relativenumber
set cursorline
set cmdheight=1
set laststatus=2
set ruler
set splitright
set splitbelow

" Vim coding option values.
set nowrap
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab
set smartindent
set autoindent
set shiftround
set showmatch

" Vim search option values.
set ignorecase
set incsearch
set hlsearch

" Vim color option values.
set t_8f=^[[38;2;%lu;%lu;%lum
set t_8b=^[[48;2;%lu;%lu;%lum
set t_Co=16
set background=dark
set termguicolors
" -----------------------------------------------------------------------------

" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" Key maps to interact with buffers.
nmap <silent> <leader>h :bprev<CR>
nmap <silent> <leader>l :bnext<CR>
nmap <silent> <leader>d :bdelete<CR>

" NOTE: The key maps of the plugin actions are found in the '.\pluginfiles\'
" -----------------------------------------------------------------------------

" Import vim-plug settings file.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\plugins.vim
" -----------------------------------------------------------------------------

" Set colorscheme when all plugs, settings, and options are loaded.
colorscheme tokyonight

" by. @wuelnerdotexe
