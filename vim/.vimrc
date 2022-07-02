" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     MYVIMRC
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal vim config.
" -----------------------------------------------------------------------------

" Skip runtime/defaults.vim
let skip_defaults_vim=1

" Don't use Vi-compatible mode.
set nocompatible
silent! while 0
  set nocompatible
silent! endwhile

" Encoding.
set encoding=utf-8

" GUI options.
set guioptions-=m
set guioptions-=T
set guifont=BlexMono\ Nerd\ Font\ Mono\ Medium\ 14

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
set nobackup
set nowritebackup
set swapfile
set directory=~/.vim/swap//
set undofile
set undodir=~/.vim/undo//
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
set listchars=trail:-
set nonumber
set norelativenumber
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
set complete= omnifunc=                        " Disabled for best performance.
set completeopt=menuone,popup
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
" SECTION: Plugins settings.
" -----------------------------------------------------------------------------
" It is indicated that the backslash key will be the `<leader>` key.
let g:mapleader='\'
let g:maplocalleader='\'

" ALE cursor.
let g:ale_hover_cursor=0
let g:ale_echo_cursor=0
let g:ale_cursor_detail=0
let g:ale_set_balloons=0

" ALE Floating.
let g:ale_floating_window_border=[
  \ '║',
  \ '═',
  \ '╔',
  \ '╗',
  \ '╝',
  \ '╚',
  \ '║',
  \ '═'
  \ ]
let g:ale_floating_preview=1

" ALE signs.
let g:ale_sign_error=''
let g:ale_sign_warning=''

" ALE virtual text.
let g:ale_virtualtext_prefix='▎'
let g:ale_virtualtext_cursor=1

" ALE linters & lsp.
let g:ale_lsp_show_message_severity='warning'
let g:ale_linters_explicit=1
let g:ale_linters={
  \ 'javascript': ['tsserver', 'eslint'],
  \ 'typescript': ['tsserver', 'eslint'],
  \ 'javascriptreact': ['tsserver', 'eslint'],
  \ 'typescriptreact': ['tsserver', 'eslint']
  \ }

" ALE fixers.
let g:ale_fixers={
  \ 'javascript': ['eslint','prettier'],
  \ 'typescript': ['eslint','prettier'],
  \ 'javascriptreact': ['eslint','prettier'],
  \ 'typescriptreact': ['eslint','prettier'],
  \ 'json': ['prettier'], 
  \ 'css': ['prettier'],
  \ 'scss': ['prettier'],
  \ 'markdown': ['prettier']
  \ }
let g:ale_fix_on_save=1

" ALE completion.
let g:ale_completion_symbols={
  \ 'class': ' פּ ',
  \ 'color': '  ',
  \ 'constant': '  ',
  \ 'constructor': '  ',
  \ 'enum': ' 練 ',
  \ 'enum member': '  ',
  \ 'event': '  ',
  \ 'field': '  ',
  \ 'file': '  ',
  \ 'folder': ' ﱮ ',
  \ 'function': '  ',
  \ 'interface': ' 蘒 ',
  \ 'keyword': '  ',
  \ 'method': '  ',
  \ 'module': '  ',
  \ 'operator': '  ',
  \ 'property': '  ',
  \ 'reference': '  ',
  \ 'snippet': '  ',
  \ 'struct': '  ',
  \ 'text': '  ',
  \ 'type_parameter': '<>',
  \ 'unit': ' 塞 ',
  \ 'value': '  ',
  \ 'variable': '[]',
  \ '<default>': ' v ',
  \ }
let g:ale_completion_enabled=1

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

" Matchit disable.
let g:loaded_matchit=1

" Match-up off-screen.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }

" Move key modifier.
let g:move_key_modifier_visualmode='A'
let g:move_key_modifier='A'

" Gitgutter messages.
let g:gitgutter_show_msg_on_hunk_jumping=1

" Gitgutter signs.
let g:gitgutter_sign_added='▎'
let g:gitgutter_sign_modified='▎'
let g:gitgutter_sign_removed='▁'
let g:gitgutter_sign_removed_first_line='▔'
let g:gitgutter_sign_removed_above_and_below='▎'
let g:gitgutter_sign_modified_removed='▎'

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
  \ '',
  \ '  ██    ██ ██ ███    ███  ',
  \ '  ██    ██ ██ ████  ████  ',
  \ '  ██    ██ ██ ██ ████ ██  ',
  \ '   ██  ██  ██ ██  ██  ██  ',
  \ '    ████   ██ ██      ██  ',
  \ '',
  \ 'the ubiquitous text editor',
  \ ''
  \ ]
let g:startify_custom_header='startify#pad(g:header)'

" Startify footer.
let g:footer=['', 'Welcome!', '']
let g:startify_custom_footer='startify#center(g:footer)'

" Airline font/symbols.
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_powerline_fonts=1

" Airline extensions.
let g:airline_extensions=([
  \ 'ale',
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
let g:airline_section_z='L%l'
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

" Enfocado theme.
let g:enfocado_style='nature' " Available: `nature` or `neon`.
let g:enfocado_plugins=[
  \ 'ale',
  \ 'fzf',
  \ 'gitgutter',
  \ 'matchup',
  \ 'nerdtree',
  \ 'netrw',
  \ 'plug',
  \ 'startify',
  \ 'yank'
  \ ]
" -----------------------------------------------------------------------------
" SECTION: Plugins main.
" -----------------------------------------------------------------------------
" Install plugins.
call plug#begin('~/.vim/plugged')

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax.
Plug 'pangloss/vim-javascript'
Plug 'stephenway/postcss.vim'

" Indent.
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'

" Typing.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'

" Linter & Autocomplete.
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'

" File manager.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

" Interfaz.
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'
Plug '~/Workspace/vim-enfocado'
Plug 'vim-airline/vim-airline'
Plug 'szw/vim-maximizer'

" Others.
Plug 'iamcco/markdown-preview.nvim',
      \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
call plug#end()
" -----------------------------------------------------------------------------
" SECTION: Plugins functions.
" -----------------------------------------------------------------------------
" If NERDTree is open in the current buffer
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

" Use <C-/> to clear the highlighting of :set hlsearch.
nnoremap <C-/> <Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-/><CR>
" -----------------------------------------------------------------------------
" SECTION: Plugins mappings.
" -----------------------------------------------------------------------------
" ALE GoTo code navigation.
nmap <silent> gd <Cmd>ALEGoToDefinition<CR>
nmap <silent> gy <Cmd>ALEGoToTypeDefinition<CR>
nmap <silent> gi <Cmd>ALEGoToImplementation<CR>
nmap <silent> gr <Cmd>ALEFindReferences<CR>

" ALE hover documentation.
nnoremap <silent> K <Cmd>ALEHover<CR>

" ALE symbol renaming.
nmap <leader>rn <Cmd>ALERename<CR>

" ALE code action to the current buffer.
nmap <leader>ac <Cmd>ALECodeAction<CR>

" Fuzzy finder activate.
nnoremap <silent> <leader>ff <Cmd>GFiles<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm <Cmd>MaximizerToggle<CR>

" NERDTree toggle.
nnoremap <silent> <leader>te <Cmd>call <SID>SmartNERDTreeToggle()<CR>

" Gitgutter show hunk diff on the current line.
nnoremap <silent> <leader>ph <Cmd>GitGutterPreviewHunk<CR>

" Reload MY VIMRC.
nnoremap <silent> <leader>rc <Cmd>source $MYVIMRC<CR>
" -----------------------------------------------------------------------------
" SECTION: Native autocmds.
" -----------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   execute "normal! g`\""
      \ | endif
" -----------------------------------------------------------------------------
" SECTION: Plugins autocmds.
" -----------------------------------------------------------------------------
" Startify cursorline.
autocmd User Startified setlocal cursorline

" Set the colorscheme when all have loaded.
autocmd VimEnter * ++nested colorscheme enfocado
