"FILE CONFIG GINIT.VIM FOR NVIM-QT by. @wuelnermartinez

"Nvim-qt recommended settings:
set mouse=a

if exists(':GuiFont')
    GuiFont! JetbrainsMonoExtraBold NF:h14
endif

if exists(':GuiTabline')
    GuiTabline 0
endif

if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

"Nvim-qt interfaz settings:
set termguicolors
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