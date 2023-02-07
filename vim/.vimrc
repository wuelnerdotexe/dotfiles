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
" Enfocado: {{{
" Theme style.
let g:enfocado_style='nature' " Available: `nature` or `neon`.

" Plugins enabled.
let g:enfocado_plugins=[
      \   'asyncomplete',
      \   'fzf',
      \   'netrw',
      \   'plug',
      \   'vim-lsp'
      \ ]
" }}}
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
let g:loaded_2html_plugin=1
let g:loaded_dvorak_plugin=1
let g:loaded_getscript=1
let g:loaded_getscriptPlugin=1
let g:loaded_gzip=1
let g:loaded_less=1
let g:loaded_logiPat=1
let g:loaded_rrhelper=1
let g:loaded_spellfile_plugin=1
let g:loaded_sql_completion=1
let g:loaded_syntax_completion=1
let g:loaded_tar=1
let g:loaded_tarPlugin=1
let g:loaded_vimball=1
let g:loaded_vimballPlugin=1
let g:loaded_xmlformat=1
let g:loaded_zip=1
let g:loaded_zipPlugin=1
" }}}
" Netrw: {{{
" Banner hidden by default.
let g:netrw_banner=0

" Exclude files.
let g:netrw_list_hide='.git,.svn,.hg,CSV,.DS_Store,Thumbs.db'
" }}}
" Human: {{{
" Options overrides.
autocmd VimEnter * set nospell norelativenumber number nowrap

" BufOnly exclude buftypes.
let g:bufonly_exclude_buftypes=['terminal']
" }}}
" Astro: {{{
" Enables TypeScript and TSX.
let g:astro_typescript='enable'
" }}}
" LSP: {{{
" Function for vim-lsp customization.
function! s:on_lsp_buffer_enabled() abort
  " Enabled lsp autocomplete sources to Vim native functions.
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  setlocal complete= omnifunc=lsp#complete

  " Basic keymaps for lsp servers.
  nmap <buffer> [d <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d <Plug>(lsp-next-diagnostic)
  nmap <buffer> <leader>dl <Plug>(lsp-document-diagnostics)
  nmap <buffer> K <Plug>(lsp-hover)
  imap <buffer> <C-k> <Cmd>LspSignatureHelp<CR>
  nmap <buffer> <leader>sr <Plug>(lsp-rename)
  nmap <buffer> <leader>rl <Plug>(lsp-references)
  nmap <buffer> gd <Plug>(lsp-definition)
  nmap <buffer> gi <Plug>(lsp-implementation)
  nmap <buffer> <leader>ca <Plug>(lsp-code-action)

  " Keymaps for navigation on lsp documents.
  nmap <buffer> <expr><c-b> lsp#scroll(-1)
  nmap <buffer> <expr><c-f> lsp#scroll(+1)

  " Enable semantic highlight.
  let g:lsp_semantic_enabled=1
endfunction

" On lsp installed.
augroup lsp_install
  autocmd!
  " Enabled lsp only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call <SID>on_lsp_buffer_enabled()
augroup END

" Settings overrides.
let g:lsp_settings={
      \   'tailwindcss-intellisense': {
      \     'allowlist': [
      \       'astro',
      \       'astro-markdown',
      \       'html',
      \       'css',
      \       'markdown',
      \       'mdx',
      \       'postcss',
      \       'sass',
      \       'scss',
      \       'stylus',
      \       'javascript',
      \       'javascriptreact',
      \       'typescript',
      \       'typescriptreact'
      \     ]
      \   }
      \ }
" }}}
" Polyglot: {{{
" Disable unnecesary options.
let g:polyglot_disabled=['sensible']

" Enhance javascriptreact syntax.
let g:vim_jsx_pretty_highlight_close_tag=1
let g:vim_jsx_pretty_colorful_config=1

" Fix typescriptreact performance.
autocmd VimEnter * set regexpengine=0
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
Plug '~/Workspace/vim-enfocado'
Plug '~/Workspace/human.vim'
Plug '~/Workspace/nerdterm'
Plug '~/Workspace/vim-astro', { 'for': 'astro' }

Plug 'sheerun/vim-polyglot'
Plug 'mattn/vim-lsp-settings' |
      \ Plug 'prabirshrestha/vim-lsp' |
      \ Plug 'prabirshrestha/asyncomplete.vim' |
      \ Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'tpope/vim-commentary'
call plug#end()
filetype plugin indent on | syntax enable
" -----------------------------------------------------------------------------
" SECTION: Mappings.
" -----------------------------------------------------------------------------
" Enfocado: {{{
" Enable colorscheme.
colorscheme enfocado
" }}}
" Builtin: {{{
" Mappings for navigation.
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Close all tabs except the current.
nmap 1t <Cmd>tabonly<CR>

" Open the current file in a new tab.
nmap <C-w>t <Cmd>tabedit %<CR>

" Open Vim terminal in the bottom window.
nmap <leader>to <Cmd>tab terminal<CR>
" }}}
" Netrw: {{{
" Toggle netrw explorer.
nmap <leader>ft <Cmd>Explore<CR>
" }}}
" Human: {{{
" Delete all buffers except the current.
nmap 1b <Plug>(BufOnly)

" Map for maximizer toggle.
nmap <C-w>m <Plug>(MaximizerToggle)

" Mappings for resizer.
nmap <M-h> <Plug>(ResizerLeft)
nmap <M-j> <Plug>(ResizerDown)
nmap <M-k> <Plug>(ResizerUp)
nmap <M-l> <Plug>(ResizerRight)

" Restoring clear screen.
nnoremap <silent> <C-w><C-l>
      \ :nohlsearch<C-R>=has('diff') ? '<Bar>diffupdate' : ''<CR><CR><C-l>
" }}}
" NERDTerm: {{{
" Toggle terminal in the bottom.
nmap <leader>tt <Plug>(NERDTermToggle)
tmap <leader>tt <Plug>(NERDTermToggle)
" }}}
