" MINIMAL FILE CONFIG .VIMRC FOR VIM SETTINGS IN SERVERS.
" -----------------------------------------------------------------------------
" NOTE: All options, settings, files and their imports are extremely ordered
" line by line to optimize Vim boot performance to the maximum.
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
let &directory=g:data_home.'swap//'
set undofile
let &undodir=g:data_home.'undo//'
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
nnoremap <silent> <C-k> 1<C-w>+
nnoremap <silent> <C-l> 1<C-w><
nnoremap <silent> <C-j> 1<C-w>-

" Mappings to move text block selected.
xnoremap <silent> K :move '<-2<CR>gv-gv
xnoremap <silent> J :move '>+1<CR>gv-gv
" -----------------------------------------------------------------------------
" GRUVBOX COLORS SETTINGS.
" Gruvbox font settings.
let g:gruvbox_bold=0
let g:gruvbox_italic=0
let g:gruvbox_underline=0
let g:gruvbox_undercurl=0
let g:gruvbox_italicize_comments=0

" Gruvbox theme settings.
let g:gruvbox_contrast_dark="hard"
" -----------------------------------------------------------------------------
" NORD COLORS SETTINGS.
" Nord font settings.
let g:nord_bold=0

" Nord theme settings.
let g:nord_cursor_line_number_background=1
let g:nord_uniform_status_lines=1
let g:nord_uniform_diff_background=1
" -----------------------------------------------------------------------------
" TOKYONIGHT COLORS SETTINGS.
" Tokyo Night font settings.
let g:tokyonight_disable_italic_comment=1

" Tokyo Night theme settings.
let g:tokyonight_style='night'
" -----------------------------------------------------------------------------
" CONQUER OF COMPLETITION SETTINGS.
" Install coc extensions.
let g:coc_global_extensions=[
    \ 'coc-marketplace',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    \ 'coc-tabnine',
    \ 'coc-vimlsp'
  \ ]

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" -----------------------------------------------------------------------------
" NERDTREE SETTINGS.
" NERDTree interfaz settings.
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeStatusline='NERDTree | working directory'

" NERDTree interaction settings.
let NERDTreeQuitOnOpen=1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" -----------------------------------------------------------------------------
" AIRLINE SETTINGS.
" No show vim native mode.
set noshowmode

" Airline extensions settings.
let g:airline_extensions=(['bookmark','branch','coc','hunks','tabline','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline section settings.
let g:airline_section_c='%f'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%y'

" Airline font/symbols settings.
let g:airline_symbols_ascii=1
" -----------------------------------------------------------------------------
" CONQUER OF COMPLETITION MAPPINGS.
" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" -----------------------------------------------------------------------------
" NERDTREE MAPPINGS.
" NERDTree toggle.
nmap <silent> <leader>te :NERDTreeToggle<CR>

" NERDTree find open file.
nmap <silent> <leader>fe :NERDTreeFind<CR>
" -----------------------------------------------------------------------------
" SIGNIFY MAPPINGS.
" Show Signify hunk diff on the current line.
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>
" -----------------------------------------------------------------------------
" FUZZY FINDER MAPPINGS.
" Find with fuzzy finder.
nnoremap <silent> <leader>ff :FZF<CR>

" Vim plugins installed with vim-plug.
call plug#begin(g:data_home.'/plugged/')
" -----------------------------------------------------------------------------
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
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/szw/vim-maximizer.git'
" Colors.
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git',{'branch':'develop'}
Plug 'https://github.com/ghifarit53/tokyonight-vim.git'
" -----------------------------------------------------------------------------
call plug#end()

" Set colorscheme when all plugs, settings, and options are loaded.
colorscheme tokyonight

" by. @wuelnerdotexe
