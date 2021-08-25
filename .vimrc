" -----------------------------------------------------------------------------
" Name:     .vimrc
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    This file is created to be easy to test by other users who want to
" test all my vim setup. My main vim files are at configs/vim/ directory.
" -----------------------------------------------------------------------------

" Set the path to the data directory depending on the OS.
if has('win32') || has ('win64')
    if has('nvim')
        let g:data_home = '~/AppData/Local/nvim-data/'
    else
        let g:data_home = '~/vimfiles/'
    endif
else
    if has('nvim')
        let g:data_home = '~/.local/share/nvim/'
    else
        let g:data_home = '~/.vim/'
    endif
endif

" Setting required to set custom option values in vim.
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
let &directory=g:data_home.'swap//'
set undofile
let &undodir=g:data_home.'undo//'
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
set number
set relativenumber
set cursorline
set noruler                 " Disabled for best performance.
set laststatus=2
set cmdheight=2
set wildmenu
set wildignorecase
set noshowcmd               " Disabled for best performance.
set noshowmode
set signcolumn=yes
set splitright
set splitbelow

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
set complete-=i             " Disabled for best performance.
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
inoremap <silent> <S-PageUp> <Esc>:bprev<CR>i

" Move next/right with buffers.
nnoremap <silent> gb :bnext<CR>
nnoremap <silent> <S-PageDown> :bnext<CR>
inoremap <silent> <S-PageDown> <Esc>:bnext<CR>i

" Delete buffers.
nnoremap <silent> <leader>db :bdelete<CR>

" Resize splits.
nnoremap <silent> <C-h> 1<C-w>>
nnoremap <silent> <C-k> 1<C-w>+
nnoremap <silent> <C-l> 1<C-w><
nnoremap <silent> <C-j> 1<C-w>-

" Move a selected block text.
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> J :move '>+1<CR>gv-gv
" -----------------------------------------------------------------------------
" SECTION: Plugins settings. 
" -----------------------------------------------------------------------------
" Coc extensions.
let g:coc_global_extensions=[
    \ 'coc-marketplace',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    \ 'coc-tabnine',
    \ 'coc-vimlsp'
  \ ]

" Coc highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" NERDTree interfaz.
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeStatusline='NERDTree | working directory'

" NERDTree interaction.
let NERDTreeQuitOnOpen=1

" NERDTree exit vim if is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Airline extensions.
let g:airline_extensions=(['bookmark','branch','coc','hunks','tabline','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let g:airline_section_c='%f'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%y'

" Airline font/symbols.
let g:airline_symbols_ascii=1
" -----------------------------------------------------------------------------
" SECTION: Colors settings. 
" -----------------------------------------------------------------------------
" NeoSolarized font.
let g:neosolarized_bold=0
let g:neosolarized_underline=0
let g:neosolarized_italic=0
let g:neosolarized_termBoldAsBright=0

" Tokyo Night interfaz.
let g:tokyonight_style='night'

" Tokyo Night font.
let g:tokyonight_disable_italic_comment=1
" -----------------------------------------------------------------------------
" SECTION: Plugins mappings. 
" -----------------------------------------------------------------------------
" Coc use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Coc GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc use K to show documentation in preview window.
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Coc symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Coc apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" NERDTree toggle.
nmap <silent> <leader>te :NERDTreeToggle<CR>

" NERDTree find open file.
nmap <silent> <leader>fe :NERDTreeFind<CR>

" Sygnify show hunk diff on the current line.
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>

" Fuzzy finder activate.
nnoremap <silent> <leader>ff :FZF<CR>

" Maximizer toggle.
nnoremap <silent> <leader>mt :MaximizerToggle<CR>
" -----------------------------------------------------------------------------
" SECTION: Plugins main. 
" -----------------------------------------------------------------------------
call plug#begin(g:data_home.'/plugged/')
" Plugins.
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/neoclide/coc.nvim.git',{'branch':'release'}
Plug 'https://github.com/preservim/nerdcommenter.git'
Plug 'https://github.com/MattesGroeger/vim-bookmarks.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/junegunn/fzf.git',{'do':{ -> fzf#install()}}
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/szw/vim-maximizer.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
" Colors.
Plug 'https://github.com/overcache/NeoSolarized.git'
Plug 'https://github.com/ghifarit53/tokyonight-vim.git'
call plug#end()

" Set colorscheme when all plugs, settings, and options are loaded.
colorscheme NeoSolarized
