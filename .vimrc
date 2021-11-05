" -----------------------------------------------------------------------------
" Name:     MY VIMRC (minimal).
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal and multi-platform Vim/Neovim config.
" -----------------------------------------------------------------------------

" Get the defaults that most users want (only vim).
if !has('nvim')
  source $VIMRUNTIME/defaults.vim
endif

" Encoding.
set encoding=utf-8

" Languajes.
set spelllang=en,es 
set helplang=en,es

" Colors.
set termguicolors
set background=dark

" Files.
set nobackup
set nowritebackup
set swapfile
set undofile
set autoread
set hidden

" Coding.
set nowrap
set conceallevel=2
set concealcursor=c
set shiftround
set autoindent
set breakindent
set showmatch
set matchpairs+=<:>
set nojoinspaces
set noemoji

" Interfaz.
set notitle
set nolist
set nonumber
set norelativenumber
set numberwidth=5
set nocursorline
set noruler                             " Disabled for best performance.
set cmdheight=1
set wildmenu
set wildignorecase
set noshowcmd                           " Disabled for best performance.
set noshowmode
set signcolumn=auto

" Statusline.
set laststatus=2
set statusline=%t\ %m\ 
set statusline+=%=\ 
set statusline+=%{&filetype}\ %{&fenc?&fenc:&enc}[%{&ff}]\ L%l\ 
set showtabline=2

" Search.
set hlsearch
set incsearch
set ignorecase
set nosmartcase
set wildignore+=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store
set wildignore+=**/node_modules,**/bower_components
set wildignorecase

" Interaction.
set confirm
set ttimeout
set ttimeoutlen=50
set complete-=i                             " Disabled for best performance.
set history=50
set shortmess+=IF
set shortmess-=S
set scroll=0
set scrolloff=0
set sidescroll=0
set sidescrolloff=0
set splitright
set splitbelow
set equalalways
set backspace=indent,eol,start
set clipboard+=unnamed,unnamedplus
set mouse=nvi

" Performance.
set synmaxcol=220
set updatetime=100
set redrawtime=1500
set nolazyredraw
set ttyfast

" Filetype and syntax.
filetype plugin indent on | syntax on
" -----------------------------------------------------------------------------
" SECTION: Plugins settings. 
" -----------------------------------------------------------------------------
" Coc extensions.
let g:coc_global_extensions=[
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-tsserver'
  \ ]

" Signify signs.
let g:signify_sign_show_count=0
let g:signify_sign_add='▎'
let g:signify_sign_change='▎'
let g:signify_sign_delete='▁'
let g:signify_sign_delete_first_line='▔'
let g:signify_sign_change_delete='~'

" NERDTree interfaz.
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusline='explorer'

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

" Airline theme.
let g:airline_theme="enfocado"
" -----------------------------------------------------------------------------
" SECTION: Plugins main. 
" -----------------------------------------------------------------------------
" Check if curl.exe is installed on 32-bit Windows.
if has('win32') && !has('win64')
  let curl_exe = 'C:\Windows\Sysnative\curl.exe'
else
  let curl_exe = 'curl'
endif

" Set path to vim-plug file.
if has('nvim')
  let plug_file=stdpath('data').'/site/autoload/plug.vim'
else
  if has('win32')
    let plug_file='$HOME/vimfiles/autoload/plug.vim'
  else
    let plug_file='$HOME/.vim/autoload/plug.vim'
  endif
endif

" Automatic installation of vim-plug only if it is not installed.
if !filereadable(expand(plug_file))
  if !executable(expand(curl_exe))
    echoerr "You have to install curl or first install vim-plug yourself!"
  endif
  echomsg "Installing vim-plug..."
  silent execute "!"curl_exe" -fLo " . shellescape(expand(plug_file)) . " --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Set path to plugins directory.
if has('nvim')
  let vim_plug=stdpath('data').'/plugged/'
else
  if has('win32')
    let vim_plug='$HOME/vimfiles/plugged/'
  else
    let vim_plug='$HOME/.vim/plugged/'
  endif
endif

" Install plugins.
call plug#begin(expand(vim_plug))
" IDE.
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Typing.
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Files.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'

" Interfaz.
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'vim-airline/vim-airline'

" Tools.
Plug 'szw/vim-maximizer'
Plug 'shime/vim-livedown'
call plug#end()

" Missing plugins are installed.
if !empty(filter(copy(g:plugs),'!isdirectory(v:val.dir)'))
  echomsg "Installing missing plugs..."
  PlugInstall --sync | source $MYVIMRC
endif

" Set Enfocado colorscheme when all have loaded.
autocmd VimEnter * ++nested colorscheme enfocado
" -----------------------------------------------------------------------------
" SECTION: Native mappings. 
" -----------------------------------------------------------------------------
" It is indicated that the <Space> key will be the <leader> key.
let mapleader="\<Space>"

" Move previous/left with buffers.
nnoremap <silent> gB <Cmd>bprev<CR>
nnoremap <silent> <S-PageUp> <Cmd>bprev<CR>
inoremap <silent> <S-PageUp> <Cmd>bprev<CR>

" Move next/right with buffers.
nnoremap <silent> gb <Cmd>bnext<CR>
nnoremap <silent> <S-PageDown> <Cmd>bnext<CR>
inoremap <silent> <S-PageDown> <Cmd>bnext<CR>

" Resize splits.
nnoremap <silent> <C-h> 1<C-w><
nnoremap <silent> <C-k> 1<C-w>+
nnoremap <silent> <C-l> 1<C-w>>
nnoremap <silent> <C-j> 1<C-w>-
" -----------------------------------------------------------------------------
" SECTION: Plugins mappings. 
" -----------------------------------------------------------------------------
" Coc make <CR> auto-select the first completion item and notify to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>

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

" Coc add `:Format` command to format current buffer.
command! -nargs=0 Format <Cmd>call CocAction('format')

" Fuzzy finder activate.
nnoremap <silent> <leader>ff <Cmd>FZF<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm <Cmd>MaximizerToggle<CR>

" NERDTree toggle.
nnoremap <silent> <leader>te <Cmd>NERDTreeToggle<CR>

" NERDTree find open file.
nnoremap <silent> <leader>fe <Cmd>NERDTreeFind<CR>

" Signify show hunk diff on the current line.
nnoremap <silent> <leader>hd <Cmd>SignifyHunkDiff<CR>

" Reload MY VIMRC.
nnoremap <silent> <leader>rc <Cmd>source $MYVIMRC<CR>
