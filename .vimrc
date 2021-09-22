" -----------------------------------------------------------------------------
" Name:     .vimrc
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    This file is created to be easy to test by other users who want to
" test all my vim setup. My main vim files are at configs/vim/ directory.
" -----------------------------------------------------------------------------

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
filetype plugin indent on | syntax on

" Files management.
set nobackup
set nowritebackup
set swapfile
set undofile
set autoread
set hidden

" Coding.
set smartindent
set showmatch
set nowrap

" Interfaz.
set notitle
set nolist
set number
set norelativenumber
set numberwidth=5
set cursorline
set noruler                                 " Disabled for best performance.
set laststatus=2
set showtabline=2
set cmdheight=1
set wildmenu
set wildignorecase
set noshowcmd                               " Disabled for best performance.
set noshowmode
set signcolumn=auto:1

" Search.
set hlsearch
set incsearch
set ignorecase
set nosmartcase
set wildignore+=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store
set wildignore+=**/node_modules,**/bower_components
set wildignorecase

" Interaction.
set ttimeout
set ttimeoutlen=50
set complete-=i                             " Disabled for best performance.
set history=50
set shortmess+=cIF
set shortmess-=S
set scroll=1
set scrolloff=0
set sidescroll=1
set sidescrolloff=0
set splitright
set splitbelow
set backspace=indent,eol,start
set clipboard=unnamed
set mouse=nvi

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
" -----------------------------------------------------------------------------
" SECTION: Plugins settings. 
" -----------------------------------------------------------------------------
" Coc extensions.
let g:coc_global_extensions=[
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-tsserver'
  \ ]

" NERDTree interfaz.
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusline='explorer'
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'

" NERDTree operation.
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$','\.svn$','\.hg$','\CSV$','\.DS_Store$','\Thumbs.db$']

" NERDTree interaction.
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1

" Airline font/symbols.
let g:airline_powerline_fonts=0
let g:airline_symbols_ascii=1

" Airline extensions.
let g:airline_extensions=(['tabline','netrw','branch','hunks','coc','term','fzf'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#branch#custom_head='gitbranch#name'
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let g:airline_section_c='%t'
let g:airline_section_z='L%l'
let g:airline_section_y='%{&fenc?&fenc:&enc}[%{&ff}] %{SleuthIndicator()}'
let g:airline_section_x='%{&filetype}'
let g:airline#extensions#default#section_truncate_width={
    \ 'b' : 100,
    \ 'y' : 100,
    \ 'x' : 100,
    \ 'error' : 100,
    \ 'warning' : 100
  \ }
" -----------------------------------------------------------------------------
" SECTION: Plugins main. 
" -----------------------------------------------------------------------------
" Providers settings for neovim plugins.
if has('nvim')
    let g:loaded_ruby_provider=0
    let g:loaded_perl_provider=0
endif

" Set path to vim-plug file.
if has('nvim')
    let g:plug_file=stdpath('data').'/site/autoload/plug.vim'
else
    let g:plug_file=has('win32') ?
        \ '$HOME/vimfiles/autoload/plug.vim' : '$HOME/.vim/autoload/plug.vim'
endif

" Automatic installation of Vim-Plug only if it is not installed.
if empty(glob(g:plug_file))
    echo "Installing Vim-Plug..."
    silent exec "!curl -fLo " . shellescape(g:plug_file) . " --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Set path to plugins directory.
let g:vim_plug=has('win32') ?
    \ '$HOME/AppData/Local/vim-plug/plugged/' : '$HOME/.config/vim-plug/plugged/'

" Install plugins.
call plug#begin(g:vim_plug)

" Files.
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/junegunn/fzf.git',{'do' : { -> fzf#install()}}

" Coding.
Plug 'https://github.com/neoclide/coc.nvim.git',{'branch' : 'release'}
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/AndrewRadev/tagalong.vim.git'

" Tools.
Plug 'https://github.com/tpope/vim-sleuth.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/szw/vim-maximizer.git',{'on' : 'MaximizerToggle'}

" Statusline.
Plug 'https://github.com/itchyny/vim-gitbranch.git'
Plug 'https://github.com/vim-airline/vim-airline.git'

" Colors.
Plug 'https://github.com/wuelnerdotexe/vim-enfocado.git'

call plug#end()

" Missing plugins are installed and set the colorscheme when all have loaded.
if !empty(filter(copy(g:plugs),'!isdirectory(v:val.dir)'))
    PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * ++nested colorscheme enfocado
" -----------------------------------------------------------------------------
" SECTION: Plugins mappings. 
" -----------------------------------------------------------------------------
" Coc make <CR> auto-select the first completion item and notify to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Coc use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Coc use tab for trigger completion with characters ahead and navigate.
inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~#'\s'
endfunction

" Coc use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'],&filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!'.&keywordprg." ".expand('<cword>')
    endif
endfunction

" Coc remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Coc GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Coc apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Fuzzy finder activate.
nnoremap <silent> <leader>ff :FZF<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm :MaximizerToggle<CR>

" NERDTree toggle.
nnoremap <silent> <leader>te :NERDTreeToggle<CR>

" NERDTree find open file.
nnoremap <silent> <leader>fe :NERDTreeFind<CR>

" Signify show hunk diff on the current line.
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>
