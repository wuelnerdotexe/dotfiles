" -----------------------------------------------------------------------------
" Name:     INIT.VIM
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal Neovim config.
" -----------------------------------------------------------------------------

" Encoding.
set encoding=utf-8

" Languages.
set spelllang=en,es
set helplang=en,es
set nospell

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
set emoji

" Interfaz.
set notitle
set list
set nonumber
set norelativenumber
set numberwidth=5
set cursorline
set noruler                             " Disabled for best performance.
set cmdheight=1
set wildmenu
set wildignorecase
set noshowcmd                           " Disabled for best performance.
set noshowmode
set signcolumn=yes:2

" Statusline.
set laststatus=2
set showtabline=2

" Search.
set hlsearch
set incsearch
set ignorecase
set nosmartcase
set wildignore+=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store
set wildignore+=**/node_modules,**/bower_components
set wildignorecase

" Substitute.
set inccommand=nosplit

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
set clipboard+=unnamedplus
set mouse=a

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
    \ 'coc-css',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-vimlsp'
  \ ]

" Coc syntax.
let g:coc_default_semantic_highlight_groups=1

" Rainbow activate.
let g:rainbow_active=1

" IndentLine chars.
let g:indentLine_setConceal=0

" IndentLine excludes.
let g:indentLine_fileTypeExclude = ['text', 'sh']
let g:indentLine_bufTypeExclude = ['help', 'terminal']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']

" IndentLine chars.
let g:indentLine_first_char='▏'
let g:indentLine_char='▏'

" IndentLine level.
let g:indentLine_showFirstIndentLevel=1

" Matchit disable.
let g:loaded_matchit=1

" Match-up off-screen.
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Signify signs.
let g:signify_sign_show_count=0
let g:signify_sign_add='▎'
let g:signify_sign_change='▎'
let g:signify_sign_delete='▁'
let g:signify_sign_delete_first_line='▔'
let g:signify_sign_change_delete='≈'

" NERDTree interfaz.
let g:NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable="●"
let NERDTreeDirArrowCollapsible="○"
let g:NERDTreeStatusline='explorer'

" NERDTree operation.
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$','\.svn$','\.hg$','\CSV$','\.DS_Store$','\Thumbs.db$']

" NERDTree interaction.
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1

" Airline font/symbols.
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_powerline_fonts=1

" Airline extensions.
let g:airline_extensions=(['branch','coc','fzf','hunks','netrw','tabline','term','whitespace'])
let g:airline#extensions#tabline#show_close_button=0
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
let g:airline_theme='enfocado'

" Enfocado theme.
let g:enfocado_style='nature' " Available: 'nature' or 'neon'.
" -----------------------------------------------------------------------------
" SECTION: Plugins main.
" -----------------------------------------------------------------------------
" Providers settings for neovim plugins.
if has('nvim')
  let g:loaded_ruby_provider=0
  let g:loaded_perl_provider=0

  " IMPORTANT: These settings depend on each user because the installation
  " is different depending on the OS, the package manager, and the Python
  " version. In my case I have Python3 installed on Windows using scoop.
  let g:loaded_python_provider=0
  let g:python3_host_prog='$HOME\scoop\apps\python\current\python.exe'
endif

" Install plugins.
call plug#begin(stdpath('data') . '\plugged\')
" IDE.
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'
Plug 'github/copilot.vim'

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
Plug 'wuelnerdotexe/vim-enfocado', { 'branch': 'development' }
Plug 'vim-airline/vim-airline'

" Tools.
Plug 'szw/vim-maximizer'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': [ 'markdown', 'vim-plug' ] }
call plug#end()

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
