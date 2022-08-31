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
let g:NERDTreeWinSize=33
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
      \   '          How setups for Vim & Neovim should be.         '
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
      \   '~/Workspace/human.vim/',
      \   '~/Workspace/nerdterm/',
      \   '~/Workspace/vim-astro/',
      \   '~/Workspace/vim-enfocado/',
      \   '~/Workspace/vitemin/',
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
" Gitgutter: {{{
" Signs customization.
let g:gitgutter_sign_priority=9
let g:gitgutter_sign_added='│'
let g:gitgutter_sign_modified='│'
" }}}
" Matchup: {{{
" Off-screen enable popup.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }
" }}}
" Lightline: {{{
" Bufferline customization.
let g:lightline#bufferline#right_aligned=1
let g:lightline#bufferline#filename_modifier=':t'
let g:lightline#bufferline#unnamed='[No Name]'

" Function for Fugitive Git status.
function! GitBranch() abort
  if &laststatus == 3
    return &columns >= 100 ?
          \ (FugitiveHead() !=# '' ? ' ' . FugitiveHead() : '') : ''
  else
    return winwidth(0) >= 100 ?
          \ (FugitiveHead() !=# '' ? ' ' . FugitiveHead() : '') : ''
  endif
endfunction

" Function for Gitgutter hunks.
function! GitStatus() abort
  let [l:added,l:modified,l:removed] = GitGutterGetHunkSummary()

  if &laststatus == 3
    return &columns >= 100 &&
          \ ((l:added != 0) || (l:modified != 0) || (l:removed != 0)) ?
          \ printf(' %d  %d  %d', l:added, l:modified, l:removed) : ''
  else
    return winwidth(0) >= 100 &&
          \ ((l:added != 0) || (l:modified != 0) || (l:removed != 0)) ?
          \ printf(' %d  %d  %d', l:added, l:modified, l:removed) : ''
  endif
endfunction

" Function for trunc filetype.
function! LightlineFiletype() abort
  if &laststatus == 3
    return &columns >= 100 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  else
    return winwidth(0) >= 100 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
  endif
endfunction

" Function for trunc Sleuth indicator.
function! SleuthStatus() abort
  if &laststatus == 3
    return &columns >= 100 ? SleuthIndicator() : ''
  else
    return winwidth(0) >= 100 ? SleuthIndicator() : ''
  endif
endfunction

" Initialize setup.
let g:lightline={
      \   'colorscheme': 'enfocado',
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   },
      \   'component': {
      \     'readonly': '%{&readonly?"":""}',
      \     'spell': '暈%{&spell?&spelllang:""}',
      \     'line': ':%l',
      \     'lineinfo': ':%l :%c ☰ %L',
      \     'tabname': 'tabs',
      \     'bufname': 'buffers'
      \   },
      \   'component_function': {
      \     'filetype': 'LightlineFiletype',
      \     'gitbranch': 'GitBranch',
      \     'gitstatus': 'GitStatus',
      \     'sleuthstatus': 'SleuthStatus'
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
      \       ['sleuthstatus', 'fileformat', 'fileencoding'],
      \       ['filetype']
      \     ]
      \   },
      \   'inactive': {
      \     'left': [['filename']],
      \     'right': [['line']]
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
      \   'ctrlp',
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
        \     'lsp_errors',
        \     'lsp_warnings',
        \     'lsp_infos',
        \     'lsp_hints',
        \     'lsp_ok'
        \   ]
        \ )
  " }}}
  " Enfocado: {{{
  " Add the neovim plugins.
  let g:enfocado_plugins+=[
        \   'cmp',
        \   'lsp',
        \   'treesitter',
        \   'indent-blankline'
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
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs'
    \ . ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Neovim conditional plugin activation.
function! Cond(cond, ...)
  let l:opts = get(a:000, 0, {})

  return a:cond ? l:opts : extend(l:opts, { 'on': [], 'for': [] })
endfunction
" }}}

" List installed plugins.
filetype plugin indent off | syntax off
call plug#begin('~/.local/share/vim-plugins')
" Options.
Plug 'wuelnerdotexe/human.vim'

" Only Neovim dependencies.
Plug 'antoinemadec/FixCursorHold.nvim', Cond(has('nvim'))
Plug 'nvim-lua/plenary.nvim', Cond(has('nvim'))

" Development.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
Plug 'wuelnerdotexe/nerdterm'

" Files managers.
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Only Neovim syntax.
Plug 'nvim-treesitter/nvim-treesitter', Cond(has('nvim'), { 'do': ':TSUpdate' })
Plug 'p00f/nvim-ts-rainbow', Cond(has('nvim'))
Plug 'lukas-reineke/indent-blankline.nvim', Cond(has('nvim'))
Plug 'JoosepAlviste/nvim-ts-context-commentstring', Cond(has('nvim'))
Plug 'windwp/nvim-ts-autotag', Cond(has('nvim'))

" Syntax.
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'

" Only Neovim kinds.
Plug 'onsails/lspkind.nvim', Cond(has('nvim'))

" Only Neovim lsp.
Plug 'williamboman/mason.nvim', Cond(has('nvim'))
Plug 'williamboman/mason-lspconfig.nvim', Cond(has('nvim'))
Plug 'neovim/nvim-lspconfig', Cond(has('nvim'))
Plug 'jose-elias-alvarez/null-ls.nvim', Cond(has('nvim'))

" Only Neovim cmp.
Plug 'hrsh7th/cmp-nvim-lsp', Cond(has('nvim'))
Plug 'hrsh7th/cmp-path', Cond(has('nvim'))
Plug 'hrsh7th/cmp-cmdline', Cond(has('nvim'))
Plug 'hrsh7th/cmp-buffer', Cond(has('nvim'))
Plug 'hrsh7th/nvim-cmp', Cond(has('nvim'))

" Only Neovim snippets.
Plug 'hrsh7th/cmp-vsnip', Cond(has('nvim'))
Plug 'hrsh7th/vim-vsnip', Cond(has('nvim'))

" Only Neovim tabnine.
Plug 'tzachar/cmp-tabnine', Cond(has('nvim'), { 'do': './install.sh' })

" Typing.
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'

" Theme.
Plug 'wuelnerdotexe/vim-enfocado', { 'branch': 'development' }

" Statusline.
Plug 'itchyny/lightline.vim'
Plug 'spywhere/lightline-lsp', Cond(has('nvim'))
Plug 'mengelbrecht/lightline-bufferline'
call plug#end()
filetype plugin indent on | syntax enable
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" NERDTerm: {{{
" Toggle terminal in the bottom.
noremap <silent> <leader>tt <Plug>(NERDTermToggle)
noremap! <silent> <leader>tt <Plug>(NERDTermToggle)
" }}}
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
" Lightline: {{{
" Force enable on filetypes.
autocmd FileType netrw,vim,startify call lightline#enable()
" }}}
" Startify: {{{
" Cursorline local enable.
autocmd User Startified setlocal cursorline
" }}}
" Human: {{{
" Options overrides.
autocmd VimEnter * set nospell noshowmode noruler nowrap
" }}}
" Enfocado: {{{
" Colorscheme enable when all have loaded.
autocmd VimEnter * ++nested colorscheme enfocado

" Local function for colorscheme customizations.
function! s:EnfocadoCustomization() abort
  if &background ==# 'dark'
    highlight Whitespace cterm=bold ctermbg=203 gui=bold guifg=#ff5e56
  else
    highlight Whitespace cterm=bold ctermbg=124 gui=bold guifg=#bf0000
  endif
endfunction

" Colorscheme customizations.
autocmd ColorScheme enfocado ++nested call <SID>EnfocadoCustomization()

if has('nvim')
  " Enable pseudo-transparency.
  set pumblend=10 winblend=10
endif
" }}}

