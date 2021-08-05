" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.
" -----------------------------------------------------------------------------
" NOTE: All options, settings, files and their imports are extremely ordered
" line by line to optimize Vim / Neovim boot performance to the maximum.
" -----------------------------------------------------------------------------

" Neovim provider settings. 
let g:loaded_python_provider=0
let g:loaded_python3_provider=0
let g:loaded_node_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0
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

" Vim color option values.
set t_Co=16
set background=dark
set termguicolors

" Vim search option values.
set ignorecase
set incsearch
set hlsearch
" -----------------------------------------------------------------------------

" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" User key-maps.
nnoremap <silent> <leader>h :bprev<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>d :bdelete<CR>
nnoremap <silent> <leader>s :SignifyHunkDiff<CR>
nnoremap <silent> <leader>m :MaximizerToggle<CR>
" -----------------------------------------------------------------------------

" Vim plugins installed with vim-plug.
call plug#begin('$LOCALAPPDATA\nvim-data\plugged\')
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/neoclide/coc.nvim.git',{'branch':'release'}
Plug 'https://github.com/preservim/nerdcommenter.git'
Plug 'https://github.com/MattesGroeger/vim-bookmarks.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git',{'branch':'develop'}
Plug 'https://github.com/ghifarit53/tokyonight-vim.git'
Plug 'https://github.com/szw/vim-maximizer.git'
call plug#end()

" Import plugin configuration files.
source $USERPROFILE\dotfiles\configs\vimfiles\settingsfiles\coc.settings.vim
source $USERPROFILE\dotfiles\configs\vimfiles\settingsfiles\nerdtree.settings.vim
source $USERPROFILE\dotfiles\configs\vimfiles\settingsfiles\airline.settings.vim
source $USERPROFILE\dotfiles\configs\vimfiles\settingsfiles\gruvbox.settings.vim
source $USERPROFILE\dotfiles\configs\vimfiles\settingsfiles\nord.settings.vim
source $USERPROFILE\dotfiles\configs\vimfiles\settingsfiles\tokyonight.settings.vim
" -----------------------------------------------------------------------------

" Set colorscheme when all plugs, settings, and options are loaded.
colorscheme tokyonight

" by. @wuelnerdotexe
