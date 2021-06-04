"FILE CONFIG INIT.VIM FOR NVIM by. @wuelnermartinez

"Nvim interfaz settings:
set termguicolors
set fillchars+=vert:•
set number relativenumber
set cursorline
set laststatus=2

"Nvim coding settings:
set encoding=utf-8
syntax on
set autoindent
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set nowrap

"Nvim search settings:
set hlsearch
set ignorecase
set incsearch

"Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
"-------------------------------------------------
Plug 'itchyny/lightline.vim'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
"Plug 'overcache/NeoSolarized'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'townk/vim-autoclose'
Plug 'yggdroot/indentline'
Plug 'chrisbra/colorizer'
"-------------------------------------------------
call plug#end()

"Plug interface settings:
let g:lightline = { 'colorscheme': 'nord' }
colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_uniform_diff_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
autocmd VimEnter * NERDTree