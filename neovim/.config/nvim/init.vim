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
" Matchup: {{{
  " Off-screen enable popup.
  let g:matchup_matchparen_offscreen={ 'method': 'popup' }
" }}}
" IndentLine: {{{
  " Filetypes excludes.
  let g:indentLine_fileTypeExclude=['nerdtree', 'netrw', 'startify']

  " Buffertypes excludes.
  let g:indentLine_bufTypeExclude=['help', 'nofile', 'terminal']

  " Color rewrite disable.
  let g:indentLine_setColors=0

  " Conceal rewrite disable.
  let g:indentLine_setConceal=0

  " First line level enable.
  let g:indentLine_showFirstIndentLevel=1
" }}}
" Emmet: {{{
  " Installation global disabled.
  let g:user_emmet_install_global=0

  " Languages extendeds.
  let g:user_emmet_settings={
    \  'javascript': { 'extends': 'jsx' },
    \  'typescript': { 'extends': 'jsx' },
    \  'javascriptreact': { 'extends': 'jsx' },
    \  'typescriptreact': { 'extends': 'jsx' }
    \ }
" }}}
" Prettier: {{{
  " Autoformat with config enable.
  let g:prettier#autoformat_require_pragma=0
  let g:prettier#autoformat_config_present=1
" }}}
" NERDTree: {{{
  " Interface customization.
  let g:NERDTreeStatusline='NERDTREE'
  let g:NERDTreeWinSize=27
  let g:NERDTreeMinimalUI=1
  let g:NERDTreeMarkBookmarks=0

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
    \ '__________      ________                  _________      ',
    \ '___  ____/_________  __/_________________ ______  /_____ ',
    \ '__  __/  __  __ \_  /_ _  __ \  ___/  __ `/  __  /_  __ \',
    \ '_  /___  _  / / /  __/ / /_/ / /__ / /_/ // /_/ / / /_/ /',
    \ '/_____/  /_/ /_//_/    \____/\___/ \__,_/ \__,_/  \____/ ',
    \ '                                                         ',
    \ '            How setups for Neo(vim) should be.           '
    \ ]
  let g:startify_custom_header='startify#center(g:custom_header)'

  " Lists enabled.
  let g:startify_lists=[
    \ { 'type': 'bookmarks', 'header': ['Bookmarks'] },
    \ { 'type': 'sessions', 'header': ['Sessions'] },
    \ ]

  " Sessions management.
  let g:startify_session_delete_buffers=0
  let g:startify_session_persistence=1
  let g:startify_session_autoload=1

  " Projects in bookmarks.
  let g:startify_change_to_vcs_root=1
  let g:startify_bookmarks=[
    \ '~/dotfiles/',
    \ '~/Workspace/enfocado/',
    \ '~/Workspace/human.vim/',
    \ '~/Workspace/vim-enfocado/',
    \ '~/Workspace/vscode-enfocado/',
    \ '~/Workspace/wuelnerdotexe.github.io/'
    \ ]

  " Footer customization.
  let g:custom_footer=['https://github.com/wuelnerdotexe/dotfiles']
  let g:startify_custom_footer='startify#center(g:custom_footer)'
" }}}
" Enfocado: {{{
  " Theme style.
  let g:enfocado_style='nature' " Available: `nature` or `neon`.

  " Plugins enabled.
  let g:enfocado_plugins=[
    \ 'fzf',
    \ 'gitgutter',
    \ 'matchup',
    \ 'nerdtree',
    \ 'netrw',
    \ 'plug',
    \ 'startify',
    \ 'visual-multi'
    \ ]
" }}}
" Airline: {{{
  " Powerline symbols enabled.
  let g:airline_powerline_fonts=1

  " Extensions enabled.
  let g:airline_extensions=([
    \ 'branch',
    \ 'fugitiveline',
    \ 'fzf',
    \ 'hunks',
    \ 'netrw',
    \ 'tabline',
    \ 'term',
    \ 'whitespace'
    \ ])

  " Git changes display.
  let g:airline#extensions#hunks#non_zero_only=1

  " Statusline sections customization.
  let g:airline_section_c='%t'
  let g:airline_section_z='L%l/%L'
  let g:airline_section_y='%{&fenc?&fenc:&enc}[%{&ff}] %{SleuthIndicator()}'
  let g:airline_section_x='%{&filetype}'

  " Statusline truncate sections.
  let g:airline#extensions#default#section_truncate_width={
    \ 'b': 100,
    \ 'y': 100,
    \ 'x': 100,
    \ 'error': 100,
    \ 'warning': 100
    \ }

  " Tabline customization.
  let g:airline#extensions#tabline#fnamemod=':t'
  let g:airline#extensions#tabline#tab_nr_type=1
  let g:airline#extensions#tabline#show_tab_count=2
  let g:airline#extensions#tabline#buf_label_first=1

  " Enfocado theme enabled.
  let g:airline_theme='enfocado'
" }}}
" -----------------------------------------------------------------------------
" SECTION: Neovim.
" -----------------------------------------------------------------------------
if has('nvim')
  " Enfocado add plugins.
  let g:enfocado_plugins+=[
    \ 'cmp',
    \ 'copilot',
    \ 'lsp',
    \ 'treesitter'
    \ ]

  " Airline add extensions.
  let g:airline_extensions+=['nvimlsp']

  " Providers disabled.
  let g:loaded_ruby_provider=0
  let g:loaded_node_provider=0
  let g:loaded_perl_provider=0

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
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  endif
" }}}

" List installed plugins.
filetype plugin indent off | syntax off
call plug#begin()
" Temporal: Nvim CursorHold fixed.
if has('nvim')
  Plug 'antoinemadec/FixCursorHold.nvim'
endif

" Options.
Plug 'wuelnerdotexe/human.vim'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax.
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'

if has('nvim')
  " Nvim syntax.
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'

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
endif

" Indent.
Plug 'tpope/vim-sleuth'
Plug 'Yggdroot/indentLine'

" Typing.
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'

" Formatter.
Plug 'prettier/vim-prettier',
      \ { 'do': 'npm install --frozen-lockfile --production' }

" Files managers.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'

" Interaction.
Plug 'farmergreg/vim-lastplace'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'simeji/winresizer'

" Interface.
Plug '~/Workspace/vim-enfocado'
Plug 'vim-airline/vim-airline'

" Development.
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
call plug#end()
filetype plugin indent on | syntax on
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Human: {{{
  nnoremap <silent> <leader>mt <Cmd>MaximizerToggle<CR>
  vnoremap <silent> <leader>mt <Cmd>MaximizerToggle<CR>
  inoremap <silent> <leader>mt <C-o><Cmd>MaximizerToggle<CR>
" }}}
" Fuzzy Finder: {{{
  " Search git files map.
  nnoremap <silent> <leader>ff <Cmd>GFiles<CR>
" }}}
" NERDTree: {{{
  " Toggle function for refresh on change directory.
  function s:smartNERDTreeToggle() abort
    if g:NERDTree.IsOpen()
      silent NERDTreeClose
    else
      silent NERDTreeCWD
    endif
  endfunction

  " Toggle smart map.
  nnoremap <silent> <leader>et <Cmd>call <SID>smartNERDTreeToggle()<CR>
" }}}
" Number Toggle: {{{
  nnoremap <silent> <leader>nt <Cmd>set relativenumber!<CR>
" }}}
" -----------------------------------------------------------------------------
" SECTION: Autocmds.
" -----------------------------------------------------------------------------
" Human: {{{
  " Because I have vim-airline.
  autocmd VimEnter * set noshowmode noruler
" }}}
" Emmet: {{{
  " Languages enabled.
  autocmd FileType css,scss,javascript EmmetInstall
" }}}
" Startify: {{{
  " Cursorline local enable.
  autocmd User Startified setlocal cursorline
" }}}
" Enfocado: {{{
  " Colorscheme enable when all have loaded.
  autocmd VimEnter * ++nested colorscheme enfocado

  " Colorscheme customizations.
  autocmd ColorScheme enfocado ++nested highlight Normal ctermbg=NONE guibg=NONE
  autocmd ColorScheme enfocado ++nested highlight NormalNC ctermbg=NONE guibg=NONE
" }}}
