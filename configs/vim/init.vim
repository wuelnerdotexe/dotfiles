" -----------------------------------------------------------------------------
" Name:     init.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    All options, settings, files and imports are extremely ordered
" line by line to optimize Vim / Neovim boot performance to the maximum.
" -----------------------------------------------------------------------------

" Setting required to set custom option values.
set nocompatible

" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
    set nocompatible
silent! endwhile

" Encoding.
set encoding=utf-8

" Languajes.
set spelllang=en,es 
set helplang=en,es

" Colors.
set termguicolors
set background=dark

" Syntax and filetype.
filetype plugin indent on
syntax enable | syntax on

" Files management.
set nobackup
set nowritebackup
set swapfile
set directory=$LOCALAPPDATA\nvim-data\swap\\
set undofile
set undodir=$LOCALAPPDATA\nvim-data\undo\\
set autoread
set hidden

" Coding.
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

" Interfaz.
set notitle
set nonumber
set relativenumber
set numberwidth=4
set cursorline
set noruler                 " Disabled for best performance.
set laststatus=2
set showtabline=0
set cmdheight=2
set wildmenu
set wildignorecase
set noshowcmd               " Disabled for best performance.
set showmode
set signcolumn=auto
set splitright
set splitbelow

" Statusline.
set statusline=%#StatusLine#
set statusline+=%t\ %m\ 
set statusline+=%=\ 
set statusline+=%y\ %p%%\ %l/%L\ 

" Search.
set hlsearch
set incsearch
set ignorecase

" Interaction.
set shortmess+=c
set shortmess+=F
set shortmess-=S
set ttimeout
set ttimeoutlen=50
set scroll=1
set scrolloff=0
set sidescroll=1
set sidescrolloff=0
set mouse=nvi
set clipboard=unnamed
set complete-=i                 " Disabled for best performance.
set history=200

" Performance.
set updatetime=100
set nolazyredraw
set ttyfast
" -----------------------------------------------------------------------------
" SECTION: Native mappings. 
" -----------------------------------------------------------------------------
" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" Move previous/left with buffers.
nnoremap <silent> gB :bprev<CR>
nnoremap <silent> <S-PageUp> :bprev<CR>
inoremap <silent> <S-PageUp> <Cmd>bprev<CR>

" Move next/right with buffers.
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> <S-PageDown> :bnext<CR>
inoremap <silent> <S-PageDown> <Cmd>bnext<CR>

" Delete buffers.
nnoremap <silent> <leader>db :bdelete<CR>

" Resize splits.
nnoremap <silent> <C-h> 10<C-w><
nnoremap <silent> <C-k> 1<C-w>+
nnoremap <silent> <C-l> 10<C-w>>
nnoremap <silent> <C-j> 1<C-w>-

" Move a selected block text.
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> J :move '>+1<CR>gv-gv

" NOTE: The key maps of the plugin actions are found in 'plugins.mappings.vim'.
" -----------------------------------------------------------------------------
" SECTION: Plugins files. 
" -----------------------------------------------------------------------------
" Import plugins main file.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\plugins.main.vim
