" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.
" -----------------------------------------------------------------------------
" NOTE: All options, settings, files and their imports are extremely ordered
" line by line to optimize Vim / Neovim boot performance to the maximum.
" -----------------------------------------------------------------------------

" Setting required to set custom option values in vim.
set nocompatible

" Vim encoding option values.
set encoding=utf-8

" Vim color option values.
set termguicolors
set background=dark

" Vim syntax and filetype option values.
filetype plugin indent on
syntax enable | syntax on

" Files management option values.
set nobackup
set nowritebackup
set undofile
set undodir=$TEMP\undofiles\

" Vim coding option values.
set autoindent
set smartindent
set shiftwidth=4
set shiftround
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set showmatch
set nowrap

" Vim interfaz option values.
set notitle
set number relativenumber
set cursorline
set ruler
set laststatus=2
set cmdheight=1
set wildmenu
set showcmd
set signcolumn=yes
set splitright
set splitbelow

" Vim search option values.
set hlsearch
set incsearch
set ignorecase

" Vim interaction option values.
set backspace=
set mouse=a
set clipboard=unnamed

" Vim performance option values.
set hidden
set lazyredraw
set ttyfast
set updatetime=100
" -----------------------------------------------------------------------------
" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" Key maps to interact with buffers.
nmap <silent> <leader>nb :bnext<CR>
nmap <silent> <leader>pb :bprev<CR>
nmap <silent> <leader>db :bdelete<CR>

" Key maps to interact with tabs.
nmap <silent> <leader>nt :tabnext<CR>
nmap <silent> <leader>pt :tabprevious<CR>
nmap <silent> <leader>ct :tabclose<CR>

" NOTE: The key maps of the plugin actions are found in the '.\pluginfiles\'
" -----------------------------------------------------------------------------
" Import vim-plug settings file.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\plugins.vim

" by. @wuelnerdotexe
