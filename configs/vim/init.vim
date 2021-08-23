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
set hidden

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
set wildignorecase
set noshowcmd
set signcolumn=yes
set splitright
set splitbelow

" Vim search option values.
set hlsearch
set incsearch
set ignorecase

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
set ttyfast
set nolazyredraw
set updatetime=100
" -----------------------------------------------------------------------------
" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" Mappings to move previous/left with buffers.
nnoremap <silent> gB :bprev<CR>
nnoremap <silent> <S-PageUp> :bprev<CR>
inoremap <silent> <S-PageUp> <Esc>:bprev<CR>i

" Mappings to move next/right with buffers.
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> <S-PageDown> :bnext<CR>
inoremap <silent> <S-PageDown> <Esc>:bnext<CR>i

" Mappings to delete/close buffers or tabs.
nnoremap <silent> <leader>db :bdelete<CR>

" Mappings to resize splits.
nnoremap <silent> <C-h> 1<C-w>>
nnoremap <silent> <C-j> 1<C-w>-
nnoremap <silent> <C-l> 1<C-w><
nnoremap <silent> <C-k> 1<C-w>+

" NOTE: The key maps of the plugin actions are found in 'plugins.mappings.vim'.
" -----------------------------------------------------------------------------
" Import vim-plug settings file.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\plugins.vim

" by. @wuelnerdotexe
