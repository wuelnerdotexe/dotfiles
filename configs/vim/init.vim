" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.
" -----------------------------------------------------------------------------
" NOTE: All options, settings, files and their imports are extremely ordered
" line by line to optimize Vim / Neovim boot performance to the maximum.
" -----------------------------------------------------------------------------

" Setting required to set custom option values in vim.
set nocompatible

" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Vim encoding option values.
set encoding=utf-8

" Vim languajes option values.
set spelllang=en,es 
set helplang=en,es

" Vim color option values.
set termguicolors
set background=dark

" Vim syntax and filetype option values.
filetype plugin indent on
syntax enable | syntax on

" Files management option values.
set nobackup
set nowritebackup
set swapfile
set directory=$LOCALAPPDATA\nvim-data\swap\\
set undofile
set undodir=$LOCALAPPDATA\nvim-data\undo\\
set autoread

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
set number
set relativenumber
set cursorline
set noruler
set laststatus=2
set cmdheight=2
set wildmenu
set noshowcmd
set signcolumn=yes
set splitright
set splitbelow

" Vim search option values.
set hlsearch
set incsearch
set ignorecase
set smartcase

" Vim interaction option values.
set shortmess+=F
set shortmess-=S
set ttimeout
set ttimeoutlen=50
set scroll=1
set scrolloff=0
set sidescroll=1
set sidescrolloff=0
set backspace=
set mouse=nvi
set clipboard=unnamed
set history=200

" Vim performance option values.
set complete-=i
set hidden
set ttyfast
set nolazyredraw
set updatetime=100
" -----------------------------------------------------------------------------
" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" Key maps to interact with buffers.
nmap <silent> <leader>nb :bnext<CR>
nmap <silent> <leader>pb :bprev<CR>
nmap <silent> <leader>db :bdelete<CR>

" Key maps to interact with tabs.
nmap <silent> <leader>ct :tabnew<CR>
nmap <silent> <leader>ct :tabclose<CR>

" NOTE: The key maps of the plugin actions are found in the '.\pluginfiles\'
" -----------------------------------------------------------------------------
" Import vim-plug settings file.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\plugins.vim

" by. @wuelnerdotexe
