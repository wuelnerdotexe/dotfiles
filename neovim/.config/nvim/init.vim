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

" Disabled builtin plugins.
let s:disable_plugins=[
      \   '2html_plugin',
      \   'bugreport',
      \   'compiler',
      \   'ftplugin',
      \   'getscript',
      \   'getscriptPlugin',
      \   'gzip',
      \   'logipat',
      \   'netrw',
      \   'netrwPlugin',
      \   'netrwSettings',
      \   'netrwFileHandlers',
      \   'matchit',
      \   'matchparen',
      \   'optwin',
      \   'rrhelper',
      \   'rplugin',
      \   'spellfile_plugin',
      \   'syntax',
      \   'synmenu',
      \   'tar',
      \   'tarPlugin',
      \   'tutor',
      \   'vimball',
      \   'vimballPlugin',
      \   'zip',
      \   'zipPlugin'
      \ ]

" Loop for disable plugins.
for s:plugin in s:disable_plugins
  execute 'let g:loaded_' . s:plugin . '=1'
endfor
" }}}
" Human: {{{
" Options overrides.
autocmd VimEnter * set nospell noshowmode noruler nowrap
" }}}
" FZF: {{{
" Customize default command with fd-find.
if executable('fd')
  let $FZF_DEFAULT_COMMAND='fd -I -H -E ".git" -E "node_modules" -t f'
elseif !has('win32') && !has('win32unix')
  let $FZF_DEFAULT_COMMAND='find -not \('
        \   . '  -type d -name ".git" -prune -o'
        \   . '  -type d -name "node_modules" -prune'
        \ . ' \) -type f -printf "%P\n"'
endif

" Default layout down.
let g:fzf_layout={ 'down': '25%' }

" Hide statusline.
autocmd! FileType fzf let g:tls=&laststatus | set laststatus=0 |
      \ autocmd BufLeave <buffer> let &laststatus=g:tls | unlet g:tls
" }}}
" Fern: {{{
" Manage files.
let g:fern#default_hidden=1
let g:fern#default_exclude='^\%(\.git\|node_modules\)$'

" Interface customization.
let g:fern#drawer_width=33
let g:fern#renderer='nerdfont'

" Disable default mappings.
let g:fern#disable_default_mappings=1

" Local function for Fern customizations.
function! s:FernCustomization() abort
  " Highlight glyps.
  call glyph_palette#apply()

  " Hide line numbers.
  setlocal nonumber norelativenumber

  " Perform nothing in explorer style but open:rightest in drawer style.
  nmap <buffer><expr>
        \ <Plug>(fern-action-open:side)
        \ fern#smart#drawer(
        \   '<Plug>(fern-action-open:rightest)',
        \   '<Plug>(fern-action-open:vsplit)',
        \   '<Cmd>echo "Fern: open to the side'.
        \   ' only available in drawer mode"<CR>'
        \ )

  " Create new mappings.
  nmap <buffer><nowait> s <Plug>(fern-action-open:side)
  nmap <buffer><nowait> t <Plug>(fern-action-open:tabedit)
  nmap <buffer><nowait> n <Plug>(fern-action-new-path)
  nmap <buffer><nowait> nd <Plug>(fern-action-new-dir)
  nmap <buffer><nowait> nf <Plug>(fern-action-new-file)
  nmap <buffer><nowait> c <Plug>(fern-action-copy)
  nmap <buffer><nowait> m <Plug>(fern-action-move)
  nmap <buffer><nowait> d <Plug>(fern-action-remove)
  nmap <buffer><nowait> am <Plug>(fern-action-mark:toggle)
  nmap <buffer><nowait> <CR> <Plug>(fern-action-open-or-expand)
  nmap <buffer><nowait> <BS> <Plug>(fern-action-collapse)
  nmap <buffer><nowait> <F5> <Plug>(fern-action-reload)
  nmap <buffer><nowait> <ESC> <Plug>(fern-action-mark:clear)
endfunction

" Fern customization.
autocmd FileType fern call <SID>FernCustomization()
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
      \   { 'type': 'sessions', 'header': [ 'Sessions' ] },
      \   { 'type': 'bookmarks', 'header': [ 'Bookmarks' ] }
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
let g:custom_footer=[ 'https://github.com/wuelnerdotexe/dotfiles' ]
let g:startify_custom_footer='startify#center(g:custom_footer)'

" Enable local cursor line.
autocmd User Startified setlocal cursorline
" }}}
" Gitgutter: {{{
" Signs customization.
let g:gitgutter_sign_priority=9
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
" }}}
" Sleuth: {{{
" Disabled filetypes.
let s:exclude_filetypes=[
      \   'checkhealth',
      \   'fern',
      \   'fugitive',
      \   'lspinfo',
      \   'man',
      \   'mason',
      \   'startify'
      \ ]

" Loop for disable filetypes.
for s:filetype in s:exclude_filetypes
  execute 'let g:sleuth_' . s:filetype . '_heuristics=0'
endfor
" }}}
" Matchup: {{{
" Off-screen enable popup.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }
" }}}
" Emmet: {{{
" React languages settings.
let g:user_emmet_settings={
      \   'javascript': { 'extends': 'jsx' },
      \   'typescript': { 'extends': 'tsx' }
      \ }

" Disable for lazy loading.
let g:user_emmet_install_global=0

" Enable on-demand for filetypes.
autocmd FileType html,css,javascriptreact,typescriptreact EmmetInstall
" }}}
" Enfocado: {{{
" Theme style.
let g:enfocado_style='neon' " Available: `nature` or `neon`.

" Plugins enabled.
let g:enfocado_plugins=[
      \   'fern',
      \   'fzf',
      \   'gitgutter',
      \   'glyph-palette',
      \   'illuminate',
      \   'matchup',
      \   'plug',
      \   'startify',
      \   'visual-multi'
      \ ]

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

if has('nvim') && has('termguicolors') && &termguicolors
  " Enable pseudo-transparency.
  set pumblend=10 winblend=10
endif
" }}}
" Lightline: {{{
" Bufferline customization.
let g:lightline#bufferline#right_aligned=1
let g:lightline#bufferline#filename_modifier=':t'
let g:lightline#bufferline#unnamed='[No Name]'

" Function for know if win is printable.
function! s:WinIsPrintable(width) abort
  if &laststatus == 3
    return &columns >= a:width ? 1 : 0
  elseif &laststatus == 2
    return winwidth(0) >= a:width ? 1 : 0
  endif
endfunction

" Function for get Git branch.
function! GitBranch() abort
  return <SID>WinIsPrintable(100) && FugitiveHead() !=# '' ?
        \ ' ' . FugitiveHead() : ''
endfunction

" Function for get Git hunks.
function! GitStatus() abort
  let [ l:added, l:modified, l:removed ] = GitGutterGetHunkSummary()

  return <SID>WinIsPrintable(100) &&
        \ (l:added != 0 || l:modified != 0 || l:removed != 0) ?
        \ printf(' %d  %d  %d', l:added, l:modified, l:removed) : ''
endfunction

" Function for get filetype.
function! LightlineFiletype() abort
  return <SID>WinIsPrintable(100) && &filetype !=# '' ? &filetype : ''
endfunction

" Function for get Sleuth indicator.
function! SleuthStatus() abort
  return <SID>WinIsPrintable(100) ? SleuthIndicator() : ''
endfunction

" Initialize setup.
let g:lightline={
      \   'colorscheme': 'enfocado',
      \   'subseparator': { 'left': '', 'right': '' },
      \   'component': {
      \     'readonly': '%{ &readonly ? "" : "" }',
      \     'spell': '暈%{ &spell ? &spelllang : "" }',
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
      \   'component_expand': { 'buffers': 'lightline#bufferline#buffers' },
      \   'component_type': { 'buffers': 'tabsel' },
      \   'active': {
      \     'left': [
      \       [
      \         'mode',
      \         'paste',
      \         'readonly',
      \         'spell'
      \       ],
      \       [ 'gitbranch', 'gitstatus' ]
      \     ],
      \     'right': [
      \       [ 'lineinfo' ],
      \       [ 'sleuthstatus', 'fileformat', 'fileencoding' ],
      \       [ 'filetype' ]
      \     ]
      \   },
      \   'inactive': { 'left': [ ['filename'] ], 'right': [ [ 'line' ] ] },
      \   'tabline': {
      \     'left': [ [ 'tabname' ], [ 'tabs' ] ],
      \     'right': [ [ 'bufname' ], [ 'buffers' ] ]
      \   }
      \ }

" Force enable on filetypes.
autocmd FileType startify call lightline#enable()
" }}}
" winresizer: {{{
" Change width of window size.
let g:winresizer_vert_resize=3

" Change height of window size.
let g:winresizer_horiz_resize=3
" }}}
" -----------------------------------------------------------------------------
" SECTION: Before nvim configs.
" -----------------------------------------------------------------------------
if has('nvim')
  " Builtin: {{{
  " Disable plugin providers.
  let g:loaded_ruby_provider=0
  let g:loaded_node_provider=0
  let g:loaded_perl_provider=0
  " }}}
  " FixCursorHold: {{{
  " Temporal: Nvim CursorHold fixed.
  let g:cursorhold_updatetime=100
  " }}}
  " Enfocado: {{{
  " Add the neovim plugins.
  let g:enfocado_plugins+=[
        \   'cmp',
        \   'indent-blankline',
        \   'lsp',
        \   'treesitter'
        \ ]
  " }}}
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
else
  " Illuminate: {{{
  " Enable Illuminate Vim version.
  let g:Illuminate_useDeprecated=1

  " Exclude filetypes.
  let g:Illuminate_ftblacklist=[
        \   'checkhealth',
        \   'fern',
        \   'fugitive',
        \   'help',
        \   'lspinfo',
        \   'man',
        \   'mason',
        \   'null-ls-info',
        \   'startify',
        \   ''
        \ ]
  " }}}
endif
" -----------------------------------------------------------------------------
" SECTION: Load plugins.
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

" Nvim dependencies.
Plug 'lewis6991/impatient.nvim', Cond(has('nvim'))
Plug 'nvim-lua/plenary.nvim', Cond(has('nvim'))

" Devicons.
Plug 'lambdalisue/nerdfont.vim'

" Development.
Plug 'wuelnerdotexe/nerdterm', { 'on': '<Plug>(NERDTermToggle)' }
Plug 'iamcco/markdown-preview.nvim', {
      \   'for': 'markdown',
      \   'do': 'cd app && npm install'
      \ }

" Files managers.
Plug 'junegunn/fzf', { 'on': 'FZF', 'do': { -> fzf#install() } }
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'mhinz/vim-startify'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Nvim lsp.
Plug 'williamboman/mason.nvim', Cond(has('nvim'))
Plug 'williamboman/mason-lspconfig.nvim', Cond(has('nvim'))
Plug 'neovim/nvim-lspconfig', Cond(has('nvim'))
Plug 'jose-elias-alvarez/null-ls.nvim', Cond(has('nvim'))

" Nvim syntax.
Plug 'nvim-treesitter/nvim-treesitter', Cond(has('nvim'), { 'do': ':TSUpdate' })
Plug 'p00f/nvim-ts-rainbow', Cond(has('nvim'))
Plug 'lukas-reineke/indent-blankline.nvim', Cond(has('nvim'))
Plug 'JoosepAlviste/nvim-ts-context-commentstring', Cond(has('nvim'))
Plug 'windwp/nvim-ts-autotag', Cond(has('nvim'))
Plug 'windwp/nvim-autopairs', Cond(has('nvim'))
Plug 'folke/todo-comments.nvim', Cond(has('nvim'))

" Syntax.
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'
Plug 'RRethy/vim-illuminate'

" Nvim snippets.
Plug 'rafamadriz/friendly-snippets', Cond(has('nvim'))
Plug 'L3MON4D3/LuaSnip', Cond(has('nvim'))

" Nvim autocomplete.
Plug 'onsails/lspkind.nvim', Cond(has('nvim'))
Plug 'hrsh7th/cmp-buffer', Cond(has('nvim'))
Plug 'hrsh7th/nvim-cmp', Cond(has('nvim'))
Plug 'hrsh7th/cmp-nvim-lsp', Cond(has('nvim'))
Plug 'ray-x/cmp-treesitter', Cond(has('nvim'))
Plug 'saadparwaiz1/cmp_luasnip', Cond(has('nvim'))
Plug 'tzachar/cmp-tabnine', Cond(has('nvim'), { 'do': './install.sh' })

" Typing.
Plug 'chaoren/vim-wordmotion'
Plug 'mattn/emmet-vim', { 'on': 'EmmetInstall' }
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'

" Colors.
Plug 'lambdalisue/glyph-palette.vim'
Plug 'wuelnerdotexe/vim-enfocado', { 'branch': 'development' }

" Statusline.
Plug 'itchyny/lightline.vim'
Plug 'spywhere/lightline-lsp', Cond(has('nvim'))
Plug 'mengelbrecht/lightline-bufferline'

" Tools.
Plug 'simeji/winresizer'
Plug 'antoinemadec/FixCursorHold.nvim', Cond(has('nvim'))
call plug#end()
filetype plugin indent on | syntax enable
" -----------------------------------------------------------------------------
" SECTION: After nvim configs.
" -----------------------------------------------------------------------------
if has('nvim')
  " Builtin: {{{
  " Enable lua filetype detection.
  let g:do_filetype_lua=1

  " Diable vim filetype detection.
  let g:did_load_filetypes=0
  " }}}
  " Impatient: {{{
  " Initialize setup.
  lua require('impatient')
  " }}}
endif
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Builtin: {{{
" Split vertically the current window.
nmap <silent> <leader>s <Cmd>vsplit<CR>
" }}}
" Human: {{{
" Mappings for maximizer toggle.
nmap <leader>mt <Plug>(MaximizerToggle)
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
nmap <silent> <leader>et <Cmd>Fern . -drawer -right -toggle<CR>

" Toggle find current file in the file tree.
nmap <silent> <leader>ef <Cmd>Fern . -reveal=% -drawer -right -toggle<CR>
" }}}

