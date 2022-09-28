" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     MYVIMRC
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal vim config.
" -----------------------------------------------------------------------------
" SECTION: Before configs.
" -----------------------------------------------------------------------------
" Builtin: {{{
" Disable VI mode.
if &compatible
  set nocompatible
endif " [...] Even when the +eval is missing.
silent! while 0 | set nocp | silent! endwhile

" Disabled Vim defaults.
let g:skip_defaults_vim=1
let g:skip_loading_mswin=1

" Disabled builtin plugins.
let s:builtin_loads=[
      \   '2html_plugin',
      \   'dvorak_plugin',
      \   'getscript',
      \   'getscriptPlugin',
      \   'gzip',
      \   'less',
      \   'logiPat',
      \   'matchit',
      \   'matchparen',
      \   'netrw',
      \   'netrwFileHandlers',
      \   'netrwPlugin',
      \   'netrwSettings',
      \   'rrhelper',
      \   'spellfile_plugin',
      \   'sql_completion',
      \   'syntax_completion',
      \   'tar',
      \   'tarPlugin',
      \   'vimball',
      \   'vimballPlugin',
      \   'xmlformat',
      \   'zip',
      \   'zipPlugin'
      \ ]

" Loop for disable loadings.
for s:load in s:builtin_loads
  execute 'let g:loaded_' . s:load . '=1'
endfor
" }}}
" Human: {{{
" Options overrides.
autocmd VimEnter * set nospell noruler

" BufOnly excludes.
let g:bufonly_exclude_filetypes=[ 'fern', 'nerdterm' ]

" Enable Vim ripgrep.
if executable('rg')
  let &grepprg = 'rg -i -. -g="'.
        \   '!.git,!.svn,!.hg,!CSV,!.DS_Store,!Thumbs.db'.
        \   '!node_modules,!bower_components,!*.code-search'.
        \ '" --vimgrep'
endif
" }}}
" FZF: {{{
" Customize default command with fd-find.
if executable('fd')
  let $FZF_DEFAULT_COMMAND='fd -I -H -E "{'.
        \   '.git,.svn,.hg,CSV,.DS_Store,Thumbs.db,'.
        \   'node_modules,bower_components,*.code-search'.
        \ '}" -t f'
endif
" }}}
" Fern: {{{
" Manage files.
let g:fern#default_hidden=1
let g:fern#default_exclude='^\%('.
      \   '\.git\|\.svn\|\.hg\|\CVS\|\.DS_Store\|\Thumbs.db\'.
      \ ')$'

" Interface customization.
let g:fern#drawer_width=33
let g:fern#renderer='nerdfont'
let g:fern#drawer_hover_popup_delay=40

" Disable default mappings.
let g:fern#disable_default_mappings=1

" Local function for Fern customizations.
function! s:FernCustomization() abort
  " Highlight glyps.
  call glyph_palette#apply()

  " Hide line numbers.
  setlocal nonumber norelativenumber

  " Perform nothing in explorer style but open:side in drawer style.
  nmap <buffer><expr>
        \ <Plug>(fern-action-open:side)
        \ fern#smart#drawer(
        \   '<Plug>(fern-action-open:rightest)',
        \   '<Plug>(fern-action-open:vsplit)',
        \   '<Plug>(fern-action-open:vsplit)'
        \ )

  " Create new mappings.
  nmap <buffer><nowait> < <Plug>(fern-action-leave)
  nmap <buffer><nowait> > <Plug>(fern-action-enter)
  nmap <buffer><nowait> w <Plug>(fern-action-cd:root)
  nmap <buffer><nowait> <CR> <Plug>(fern-action-open-or-expand)
  nmap <buffer><nowait> <BS> <Plug>(fern-action-collapse)
  nmap <buffer><nowait> <C-t> <Plug>(fern-action-open:tabedit)
  nmap <buffer><nowait> <C-x> <Plug>(fern-action-open:split)
  nmap <buffer><nowait> <C-v> <Plug>(fern-action-open:side)
  nmap <buffer><nowait> n <Plug>(fern-action-new-path)
  nmap <buffer><nowait> nf <Plug>(fern-action-new-file)
  nmap <buffer><nowait> nd <Plug>(fern-action-new-dir)
  nmap <buffer><nowait> m <Plug>(fern-action-move)
  nmap <buffer><nowait> c <Plug>(fern-action-copy)
  nmap <buffer><nowait> d <Plug>(fern-action-remove)
  nmap <buffer><nowait> q <Cmd>quit<CR>
  nmap <buffer><nowait> <F5> <Plug>(fern-action-reload)
endfunction

" Fern customization.
autocmd FileType fern call <SID>FernCustomization()
" }}}
" Gitgutter: {{{
" Signs priority.
let g:gitgutter_sign_priority=9

" Signs customization.
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_removed_above_and_below = '┃'
let g:gitgutter_sign_modified_removed = '┃'
" }}}
" Sleuth: {{{
" Disabled filetypes.
let s:exclude_filetypes=[
      \   'fern',
      \   'fugitive',
      \   'fugitiveblame',
      \   'fzf',
      \   'list',
      \   'nerdterm',
      \   'qf'
      \ ]

" Loop for disable filetypes.
for s:filetype in s:exclude_filetypes
  execute 'let g:sleuth_' . s:filetype . '_heuristics=0'
endfor
" }}}
" Matchup: {{{
" Adjust performance for better ux.
let g:matchup_matchparen_timeout=40
let g:matchup_matchparen_insert_timeout=40
let g:matchup_matchparen_deferred=1
let g:matchup_matchparen_deferred_show_delay=40
let g:matchup_matchparen_deferred_hide_delay=40

" Off-screen enable popup.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }
" }}}
" Illuminate: {{{
" Enable Illuminate Vim version.
let g:Illuminate_useDeprecated=1

" Delay in milliseconds.
let g:Illuminate_delay=40

" Exclude filetypes.
let g:Illuminate_ftblacklist=[
      \   'fern',
      \   'fugitive',
      \   'fugitiveblame',
      \   'fzf',
      \   'help',
      \   'list',
      \   'nerdterm',
      \   'qf',
      \   'vim-plug'
      \ ]
" }}}
" Emmet: {{{
" Disable for lazy loading.
let g:user_emmet_install_global=0

" React languages settings.
let g:user_emmet_settings={
      \   'javascript': { 'extends': 'jsx' },
      \   'typescript': { 'extends': 'tsx' }
      \ }

" Enable on-demand for filetypes.
autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
" }}}
" Enfocado: {{{
" Theme style.
let g:enfocado_style='nature' " Available: `nature` or `neon`.

" Plugins enabled.
let g:enfocado_plugins=[
      \   'fern',
      \   'fzf',
      \   'gitgutter',
      \   'glyph-palette',
      \   'illuminate',
      \   'matchup',
      \   'plug',
      \   'visual-multi'
      \ ]
" }}}
" Lightline: {{{
" Bufferline customization.
let g:lightline#bufferline#enable_nerdfont=1
let g:lightline#bufferline#filename_modifier=':t'
let g:lightline#bufferline#unnamed='[No Name]'

" Function for get the working directory.
function! CurrentWorkingDirectory() abort
  return winwidth(0) > 83 ? ' ' . fnamemodify(getcwd(), ':t') : ''
endfunction

" Function for get Git branch.
function! GitBranch() abort
  return winwidth(0) > 83 && FugitiveHead() !=# '' ?
        \ ' ' . FugitiveHead() : ''
endfunction

" Function for get Git hunks.
function! GitHunks() abort
  if FugitiveHead() !=# ''
    let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()

    return winwidth(0) > 83 ?
          \ printf('+ %d ~ %d - %d', l:added, l:modified, l:removed) : ''
  endif

  return ''
endfunction

" Function for get filetype.
function! LightlineFiletype() abort
  return winwidth(0) > 83 && &filetype !=# '' ? &filetype : ''
endfunction

" Function for get Sleuth indicator.
function! SleuthStatus() abort
  return winwidth(0) > 83 ? SleuthIndicator() : ''
endfunction

" Function for get the tab number.
function! LightlineTabRight() abort
  return reverse(lightline#tabs())
endfunction

" Initialize setup.
let g:lightline={
      \   'colorscheme': 'enfocado',
      \   'subseparator': { 'left': '', 'right': '' },
      \   'component': { 'lineinfo': '☰ %P/%L :%l :%c' },
      \   'component_function': {
      \     'filetype': 'LightlineFiletype',
      \     'cwd': 'CurrentWorkingDirectory',
      \     'gitbranch': 'GitBranch',
      \     'githunks': 'GitHunks',
      \     'sleuthstatus': 'SleuthStatus'
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'rtabs': 'LightlineTabRight'
      \   },
      \   'component_type': { 'buffers': 'tabsel', 'rtabs': 'tabsel' },
      \   'active': {
      \     'left': [ [ 'lineinfo' ], [ 'cwd', 'gitbranch', 'githunks' ] ],
      \     'right': [
      \       [
      \         'fileencoding',
      \         'filetype',
      \         'sleuthstatus',
      \         'fileformat'
      \       ]
      \     ]
      \   },
      \   'inactive': {
      \     'left': [ [ 'lineinfo' ], [ 'filename' ] ], 'right': ''
      \   },
      \   'tab': { 'active': [ 'tabnum' ], 'inactive': [ 'tabnum' ] },
      \   'tabline': { 'left': [ [ 'buffers' ] ], 'right': [ [ 'rtabs' ] ] }
      \ }
" }}}
" -----------------------------------------------------------------------------
" SECTION: Load plugins.
" -----------------------------------------------------------------------------
" Boostrapping: {{{
" Auto installation in Vim.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs ' .
        \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif
" }}}

" List installed plugins.
filetype plugin indent off | syntax off
call plug#begin()
" Enhacements.
Plug 'wuelnerdotexe/human.vim'

" Devicons.
Plug 'lambdalisue/nerdfont.vim'

" Development.
Plug 'wuelnerdotexe/nerdterm', { 'on': '<Plug>(NERDTermToggle)' }
Plug 'iamcco/markdown-preview.nvim', {
      \   'for': 'markdown',
      \   'do': 'cd app && npm install'
      \ }

" Files managers.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() }, 'on': 'FZF' }
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax.
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'
Plug 'RRethy/vim-illuminate'

" Typing.
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'

" Colors.
Plug 'lambdalisue/glyph-palette.vim'
Plug 'wuelnerdotexe/vim-enfocado', { 'branch': 'development' }

" Statusline.
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
call plug#end()
filetype plugin indent on | syntax enable
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Builtin: {{{
" Close all windows except the current.
nmap <silent> 1w <Cmd>only<CR>

" Close all tabs except the current.
nmap <silent> 1t <Cmd>tabonly<CR>
" }}}
" Human: {{{
" Delete all buffers except the current.
nmap 1b <Plug>(BufOnly)

" Map for maximizer toggle.
nmap mt <Plug>(MaximizerToggle)

" Mappings for resizer.
nmap <M-Left> <Plug>(ResizerLeft)
nmap <M-Down> <Plug>(ResizerDown)
nmap <M-Up> <Plug>(ResizerUp)
nmap <M-Right> <Plug>(ResizerRight)
" }}}
" NERDTerm: {{{
" Toggle terminal in the bottom.
nmap <leader>tt <Plug>(NERDTermToggle)
tmap <leader>tt <Plug>(NERDTermToggle)
" }}}
" FZF: {{{
" Find files with default command.
nmap <silent> <leader>ff <Cmd>FZF<CR>
" }}}
" Fern: {{{
" Toggle file tree in the current working directory.
nmap <silent> <leader>ft <Cmd>Fern . -drawer -width=33 -toggle<CR>

" Toggle find current file in the file tree.
nmap <silent> <leader>fr <Cmd>Fern . -reveal=% -drawer -width=33 -toggle<CR>
" }}}

