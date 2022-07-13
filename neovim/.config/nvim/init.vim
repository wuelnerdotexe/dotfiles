" -----------------------------------------------------------------------------
" Name:     MYVIMRC
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal vim config.
" -----------------------------------------------------------------------------

" Don't use Vi-compatible mode.
set nocompatible
silent! while 0
  set nocompatible
silent! endwhile

" Encoding.
set encoding=utf-8

" Languages.
set nolangremap
set spelllang=en,es
set helplang=en,es
set spell

" Colors.
set t_Co=256
set termguicolors
set background=dark

" Files.
set nofsync
set nobackup
set nowritebackup
set noswapfile
set noundofile
set sessionoptions-=options
set viewoptions-=options
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
set formatoptions+=j
set emoji

" Interfaz.
set title
set titlestring=Vim
set list
set nonumber
set norelativenumber
set listchars=trail:-
set numberwidth=5
set cursorline
set noruler                                    " Disabled for best performance.
set pumheight=15
set pumwidth=15
set cmdheight=1
set cmdwinheight=15
set wildmenu
set wildignorecase
set noshowcmd                                  " Disabled for best performance.
set noshowmode
set signcolumn=yes

" Statusline.
set laststatus=2
set showtabline=2

" Search.
set hlsearch
set incsearch
set ignorecase
set nosmartcase
set wildignore+=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store
set wildignore+=**/node_modules,**/bower_components,**/.vscode
set wildignorecase

" Interaction.
set belloff=all
set confirm
set ttimeout
set ttimeoutlen=50
set completeopt=menuone,noselect
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
set nostartofline
set backspace=indent,eol,start
set clipboard=unnamedplus
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
" SECTION: Neovim setup.
" -----------------------------------------------------------------------------
if has('nvim')
  " Nvim options.
  set titlestring=Neovim
  set signcolumn=yes:2
  set inccommand=nosplit

  " Nvim providers.
  let g:loaded_ruby_provider=0
  let g:loaded_node_provider=0
  let g:loaded_perl_provider=0

  " Nvim config.
  let g:nvimrc=1
endif
" -----------------------------------------------------------------------------
" SECTION: Plugins config.
" -----------------------------------------------------------------------------
" It is indicated that the backslash key will be the `<leader>` key.
let g:mapleader='\'
let g:maplocalleader='\'

" Gitgutter messages.
let g:gitgutter_show_msg_on_hunk_jumping=1

" Gitgutter signs.
let g:gitgutter_sign_added='▎'
let g:gitgutter_sign_modified='▎'
let g:gitgutter_sign_removed='▁'
let g:gitgutter_sign_removed_first_line='▔'
let g:gitgutter_sign_removed_above_and_below='▎'
let g:gitgutter_sign_modified_removed='▎'

" Polyglot plugins.
let g:polyglot_disabled=['sensible', 'autoindent']

" IndentLine color.
let g:indentLine_setColors=0

" IndentLine conceal.
let g:indentLine_setConceal=0

" IndentLine excludes.
let g:indentLine_fileTypeExclude=['text', 'sh']
let g:indentLine_bufTypeExclude=['help', 'terminal']
let g:indentLine_bufNameExclude=['_.*', 'NERD_tree.*']

" IndentLine chars.
let g:indentLine_first_char='▏'
let g:indentLine_char='▏'

" IndentLine level.
let g:indentLine_showFirstIndentLevel=1

" Move key modifier.
let g:move_key_modifier_visualmode='A'
let g:move_key_modifier='A'

" Prettier autoformat.
let g:prettier#autoformat_require_pragma=0
let g:prettier#autoformat_config_present=1

" NERDTree replace netrw.
let g:NERDTreeHijackNetrw=1

" NERDTree interfaz.
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='●'
let g:NERDTreeDirArrowCollapsible='○'
let g:NERDTreeStatusline='explorer'

" NERDTree operation.
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=[
  \ '\.git$',
  \ '\.svn$',
  \ '\.hg$',
  \ '\CSV$',
  \ '\.DS_Store$',
  \ '\Thumbs.db$',
  \ '\.vscode$',
  \ ]

" NERDTree interaction.
let g:NERDTreeChDirMode=2
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1

" Startify lists.
let g:startify_lists=[
  \ { 'type': 'bookmarks', 'header': ['Bookmarks'] },
  \ { 'type': 'sessions', 'header': ['Sessions'] },
  \ ]

" Startify bookmarks.
let g:startify_bookmarks=[
  \ '~/dotfiles/',
  \ '~/Workspace/enfocado/',
  \ '~/Workspace/vim-enfocado/',
  \ '~/Workspace/vscode-enfocado/',
  \ '~/Workspace/wuelnerdotexe.github.io/'
  \ ]

" Startify options.
let g:startify_session_autoload=1
let g:startify_session_persistence=1
let g:startify_change_to_dir=1
let g:startify_change_to_vcs_root=1
let g:startify_enable_special=0
let g:startify_relative_path=1

" Startify header.
let g:header=[
  \ '__________      ________                  _________      ',
  \ '___  ____/_________  __/_________________ ______  /_____ ',
  \ '__  __/  __  __ \_  /_ _  __ \  ___/  __ `/  __  /_  __ \',
  \ '_  /___  _  / / /  __/ / /_/ / /__ / /_/ // /_/ / / /_/ /',
  \ '/_____/  /_/ /_//_/    \____/\___/ \__,_/ \__,_/  \____/ ',
  \ '                                                         ',
  \ '            How setups for Neo(vim) should be.           '
  \ ]
let g:startify_custom_header='startify#center(g:header)'

" Startify footer.
let g:footer=['https://github.com/wuelnerdotexe/dotfiles']
let g:startify_custom_footer='startify#center(g:footer)'

" Matchit disable.
let g:loaded_matchit=1

" Match-up off-screen.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }

" Enfocado theme.
let g:enfocado_style='nature' " Available: `nature` or `neon`.
let g:enfocado_plugins=[
  \ 'fzf',
  \ 'gitgutter',
  \ 'matchup',
  \ 'nerdtree',
  \ 'netrw',
  \ 'plug',
  \ 'startify',
  \ 'yank'
  \ ]

" Airline font/symbols.
let g:airline_powerline_fonts=1

" Airline extensions.
let g:airline_extensions=([
  \ 'branch',
  \ 'fzf',
  \ 'hunks',
  \ 'netrw',
  \ 'tabline',
  \ 'term',
  \ 'whitespace'
  \ ])
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let g:airline_section_c='%t'
let g:airline_section_z='L%l/%L'
let g:airline_section_y='%{&fenc?&fenc:&enc}[%{&ff}] %{SleuthIndicator()}'
let g:airline_section_x='%{&filetype}'
let g:airline#extensions#default#section_truncate_width={
  \ 'b': 100,
  \ 'y': 100,
  \ 'x': 100,
  \ 'error': 100,
  \ 'warning': 100
  \ }

" Airline theme.
let g:airline_theme='enfocado'
" -----------------------------------------------------------------------------
" SECTION: Plugins init.
" -----------------------------------------------------------------------------
" Install plugins.
call plug#begin('~/.local/share/vim-plugins')

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax.
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'

if exists('g:nvimrc') && g:nvimrc == 1
  " Nvim syntax.
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'windwp/nvim-ts-autotag'

  " Nvim lsp.
  Plug 'neovim/nvim-lspconfig'

  " Nvim cmp.
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'

  " Nvim snippets.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " Nvim copilot.
  Plug 'github/copilot.vim'
else
  " Vim syntax.
  Plug 'sheerun/vim-polyglot'

  " Vim autocomplete.
  Plug 'vim-scripts/AutoComplPop'
endif

" Indent.
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'

" Typing.
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'

" Formatter.
Plug 'prettier/vim-prettier',
      \ { 'do': 'npm install --frozen-lockfile --production' }

" File manager.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

" Interfaz.
Plug 'machakann/vim-highlightedyank'
Plug '~/Workspace/vim-enfocado'
Plug 'vim-airline/vim-airline'
Plug 'szw/vim-maximizer'

" Others.
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()
" -----------------------------------------------------------------------------
" SECTION: Plugins functions.
" -----------------------------------------------------------------------------
" NERDTree toggle refresh on change directory.
function s:SmartNERDTreeToggle() abort
  if g:NERDTree.IsOpen()
    silent NERDTreeClose
  else
    silent NERDTreeCWD
  endif
endfunction
" -----------------------------------------------------------------------------
" SECTION: Native mappings.
" -----------------------------------------------------------------------------
" Move previous/left with buffers.
nnoremap <silent> gB <Cmd>bprev<CR>
nnoremap <silent> <S-PageUp> <Cmd>bprev<CR>
inoremap <silent> <S-PageUp> <Cmd>bprev<CR>

" Move next/right with buffers.
nnoremap <silent> gb <Cmd>bnext<CR>
nnoremap <silent> <S-PageDown> <Cmd>bnext<CR>
inoremap <silent> <S-PageDown> <Cmd>bnext<CR>

" Resize splits.
nnoremap <silent> <C-H> 1<C-W><
nnoremap <silent> <C-K> 1<C-W>+
nnoremap <silent> <C-L> 1<C-W>>
nnoremap <silent> <C-J> 1<C-W>-
" -----------------------------------------------------------------------------
" SECTION: Plugins mappings.
" -----------------------------------------------------------------------------
" Fuzzy finder activate.
nnoremap <silent> <leader>ff <Cmd>GFiles<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm <Cmd>MaximizerToggle<CR>

" NERDTree toggle.
nnoremap <silent> <leader>te <Cmd>call <SID>SmartNERDTreeToggle()<CR>

" Gitgutter show hunk diff on the current line.
nnoremap <silent> <leader>ph <Cmd>GitGutterPreviewHunk<CR>
" -----------------------------------------------------------------------------
" SECTION: Native autocmds.
" -----------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   execute "normal! g`\""
      \ | endif
" -----------------------------------------------------------------------------
" SECTION: Plugins autocmds.
" -----------------------------------------------------------------------------
" Startify cursorline.
autocmd User Startified setlocal cursorline

" Enfocado enable when all have loaded.
autocmd VimEnter * ++nested colorscheme enfocado

" Enfocado customizations.
augroup enfocado_customization
  autocmd!
    autocmd ColorScheme enfocado highlight Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme enfocado highlight NormalNC ctermbg=NONE guibg=NONE
augroup END
