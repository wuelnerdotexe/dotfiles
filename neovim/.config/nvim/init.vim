" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     MYVIMRC
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal vim config.
" -----------------------------------------------------------------------------

" Don't use Vi-compatible mode.
if &compatible
  set nocompatible
endif

" Even when the +eval is missing.
silent! while 0
  set nocompatible
silent! endwhile
" -----------------------------------------------------------------------------
" SECTION: Configs.
" -----------------------------------------------------------------------------
" Netrw: {{{
" Banner hidden by default.
let g:netrw_banner=0
" }}}
" NERDTree: {{{
" Interface customization.
let g:NERDTreeStatusline=-1
let g:NERDTreeWinSize=float2nr(&columns * 0.25)
let g:NERDTreeMinimalUI=1
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeDirArrowExpandable=''
let g:NERDTreeDirArrowCollapsible=''

" Files display.
let g:NERDTreeShowHidden=1
let g:NERDTreeRespectWildIgnore=1

" Manage and interaction.
let g:NERDTreeChDirMode=2
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMouseMode=3
" }}}
" Startify: {{{
" Header customization.
let g:custom_header=[
      \   '__________      ________                  _________      ',
      \   '___  ____/_________  __/_________________ ______  /_____ ',
      \   '__  __/  __  __ \_  /_ _  __ \  ___/  __ `/  __  /_  __ \',
      \   '_  /___  _  / / /  __/ / /_/ / /__ / /_/ // /_/ / / /_/ /',
      \   '/_____/  /_/ /_//_/    \____/\___/ \__,_/ \__,_/  \____/ ',
      \   '                                                         ',
      \   '            How setups for Neo(vim) should be.           '
      \ ]
let g:startify_custom_header='startify#center(g:custom_header)'

" Lists enabled.
let g:startify_lists=[
      \   { 'type': 'bookmarks', 'header': ['Bookmarks'] },
      \   { 'type': 'sessions', 'header': ['Sessions'] },
      \ ]

" Sessions management.
let g:startify_session_delete_buffers=0
let g:startify_session_persistence=1
let g:startify_session_autoload=1

" Projects in bookmarks.
let g:startify_change_to_vcs_root=1
let g:startify_bookmarks=[
      \   '~/dotfiles/',
      \   '~/Workspace/enfocado/',
      \   '~/Workspace/vim-enfocado/',
      \   '~/Workspace/wuelnerdotexe.github.io/'
      \ ]

" Footer customization.
let g:custom_footer=['https://github.com/wuelnerdotexe/dotfiles']
let g:startify_custom_footer='startify#center(g:custom_footer)'
" }}}
" CtrlP: {{{
" Enable scan for dotfiles.
let g:ctrlp_show_hidden=1
" }}}
" Fugitive: {{{
" Function for lightline integration.
function! GitBranch()
  return FugitiveHead() ==# '' ? '' : ' ' . FugitiveHead()
endfunction
" }}}
" Gitgutter: {{{
" Signs customization.
let g:gitgutter_sign_priority=9
let g:gitgutter_sign_added='│'
let g:gitgutter_sign_modified='│'

" Function for lightline integration.
function! GitStatus()
  let [l:added,l:modified,l:removed] = GitGutterGetHunkSummary()
  return (l:added == 0) && (l:modified == 0) && (l:removed == 0) ?
        \ '' : printf(' %d  %d  %d', l:added, l:modified, l:removed)
endfunction
" }}}
" Matchup: {{{
" Off-screen enable popup.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }
" }}}
" IndentLine: {{{
" Filetypes excludes.
let g:indentLine_fileTypeExclude=['nerdtree', 'netrw', 'startify']

" Buffertypes excludes.
let g:indentLine_bufTypeExclude=[
      \   'help',
      \   'nofile',
      \   'quickfix',
      \   'terminal'
      \ ]

" Color rewrite disable.
let g:indentLine_setColors=0

" Conceal rewrite disable.
let g:indentLine_setConceal=0

" First line level enable.
let g:indentLine_showFirstIndentLevel=1

" Chars customization.
let g:indentLine_char='│'
let g:indentLine_first_char='│'
" }}}
" Prettier: {{{
" Autoformat with config enable.
let g:prettier#autoformat_require_pragma=0
let g:prettier#autoformat_config_present=1
" }}}
" Lightline: {{{
" Bufferline customization.
let g:lightline#bufferline#right_aligned=1
let g:lightline#bufferline#filename_modifier=':t'
let g:lightline#bufferline#unnamed='[No Name]'

" Initialize setup.
let g:lightline={
      \   'colorscheme': 'enfocado',
      \   'separator': {
      \     'left': '',
      \     'right': ''
      \   },
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   },
      \   'component': {
      \     'readonly': '%{&readonly?"":""}',
      \     'spell': '暈 %{&spell?&spelllang:""}',
      \     'lineinfo': '☰ %L  %l  %c',
      \     'tabname': 'tabs',
      \     'bufname': 'buffers'
      \   },
      \   'component_function': {
      \     'gitbranch': 'GitBranch',
      \     'gitstatus': 'GitStatus',
      \     'sleuthindicator': 'SleuthIndicator'
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers'
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel'
      \   },
      \   'active': {
      \     'left': [
      \       [
      \         'mode',
      \         'paste',
      \         'readonly',
      \         'spell'
      \       ],
      \       ['gitbranch', 'gitstatus']
      \     ],
      \     'right': [
      \       ['lineinfo'],
      \       [
      \         'filetype',
      \         'sleuthindicator',
      \         'fileformat',
      \         'fileencoding'
      \       ]
      \     ]
      \   },
      \   'inactive': {
      \     'left': [['filename']],
      \     'right': [['lineinfo']]
      \   },
      \   'tabline': {
      \     'left': [['tabname'], ['tabs']],
      \     'right': [['bufname'], ['buffers']]
      \   }
      \ }
" }}}
" Enfocado: {{{
" Theme style.
let g:enfocado_style='nature' " Available: `nature` or `neon`.

" Plugins enabled.
let g:enfocado_plugins=[
      \   'gitgutter',
      \   'matchup',
      \   'nerdtree',
      \   'netrw',
      \   'plug',
      \   'startify',
      \   'visual-multi'
      \ ]
" }}}
" -----------------------------------------------------------------------------
" SECTION: Neovim.
" -----------------------------------------------------------------------------
if has('nvim')
  " Lightline: {{{
  " Enable bufferline is clickable.
  let g:lightline#bufferline#clickable=1
  let g:lightline.component_raw={ 'buffers': 1 }

  " Configuration lightline-lsp.
  let g:lightline#lsp#indicator_errors=' '
  let g:lightline#lsp#indicator_warnings=' '
  let g:lightline#lsp#indicator_infos=' '
  let g:lightline#lsp#indicator_hints=' '
  let g:lightline#lsp#indicator_ok=' LSP'

  " Register the components.
  let g:lightline.component_expand.lsp_errors='lightline#lsp#errors'
  let g:lightline.component_expand.lsp_warnings='lightline#lsp#warnings'
  let g:lightline.component_expand.lsp_infos='lightline#lsp#infos'
  let g:lightline.component_expand.lsp_hints='lightline#lsp#hints'
  let g:lightline.component_expand.lsp_ok='lightline#lsp#ok'

  " Set color to the components.
  let g:lightline.component_type.lsp_errors='error'
  let g:lightline.component_type.lsp_warnings='warning'
  let g:lightline.component_type.lsp_infos='info'
  let g:lightline.component_type.lsp_hints='hint'

  " Add the components.
  let g:lightline.active.left=add(
        \   g:lightline.active.left,
        \   [
        \     'lsp_ok',
        \     'lsp_errors',
        \     'lsp_warnings',
        \     'lsp_infos',
        \     'lsp_hints'
        \   ]
        \ )
  " }}}
  " Enfocado: {{{
  " Add the neovim plugins.
  let g:enfocado_plugins+=[
        \   'cmp',
        \   'ctrlp',
        \   'lsp',
        \   'lsp-installer',
        \   'treesitter'
        \ ]
  " }}}
  " Providers: {{{
  " Disable plugin providers.
  let g:loaded_ruby_provider=0
  let g:loaded_node_provider=0
  let g:loaded_perl_provider=0
  " }}}
  " Temporal: Nvim CursorHold fixed.
  let g:cursorhold_updatetime=100
endif
" -----------------------------------------------------------------------------
" SECTION: Plugins init.
" -----------------------------------------------------------------------------
" Vim Plug: {{{
" Auto installation in Vim or Neovim.
let data_dir = has('nvim') ? stdpath('data').'/site' : '~/.vim'
if empty(glob(data_dir.'/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}

" List installed plugins.
filetype plugin indent off | syntax off
call plug#begin()
" Temporal: Nvim CursorHold fixed.
if has('nvim')
  Plug 'antoinemadec/FixCursorHold.nvim'
endif

" Files managers.
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Statusline.
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

if has('nvim')
  " Nvim syntax.
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'windwp/nvim-ts-autotag'

  " Nvim kinds.
  Plug 'onsails/lspkind.nvim'

  " Nvim lsp.
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'neovim/nvim-lspconfig'
  Plug 'spywhere/lightline-lsp'

  " Nvim cmp.
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'

  " Nvim snippets.
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'

  " Nvim tabnine.
  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
endif

" Syntax.
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'

" Indent.
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'

" Typing.
Plug 'matze/vim-move'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi'

" Formatter.
Plug 'prettier/vim-prettier',
      \ { 'do': 'npm install --frozen-lockfile --production' }

" Development.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

" Install Wuelner's vim plugins.
Plug 'wuelnerdotexe/human.vim'
Plug '~/Workspace/vim-enfocado'
call plug#end()
filetype plugin indent on | syntax on
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Netrw: {{{
" Open files in window map.
nnoremap <silent> <leader>eo <Cmd>Explore<CR>
" }}}
" NERDTree: {{{
" Toggle tree in the root of VCS repo.
nnoremap <silent> <leader>et <Cmd>NERDTreeToggleVCS<CR>
" }}}
" Human: {{{
" Map for maximizer.
noremap <silent> <leader>mt <Plug>(MaximizerToggle)
noremap! <silent> <leader>mt <Plug>(MaximizerToggle)
" }}}
" -----------------------------------------------------------------------------
" SECTION: Autocmds.
" -----------------------------------------------------------------------------
" Netrw: {{{
" Enable lightline.
autocmd filetype netrw,vim call lightline#enable()
" }}}
" Startify: {{{
" Cursorline local enable.
autocmd User Startified setlocal cursorline
" }}}
" Human: {{{
" Options overrides.
autocmd VimEnter * set noshowmode noruler nospell
" }}}
" Enfocado: {{{
" Colorscheme enable when all have loaded.
autocmd VimEnter * ++nested colorscheme enfocado

" Colorscheme customizations.
autocmd ColorScheme enfocado ++nested highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme enfocado ++nested highlight NormalNC ctermbg=NONE guibg=NONE
" }}}
