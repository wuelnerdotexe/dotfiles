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
" Netrw: {{{
" Banner hidden by default.
let g:netrw_banner=0

" Exclude files.
let g:netrw_list_hide='.git,.svn,.hg,CSV,.DS_Store,Thumbs.db'
" }}}
" Human: {{{
" Options overrides.
autocmd VimEnter * set nospell

" BufOnly excludes.
let g:bufonly_exclude_filetypes=['nerdterm']
" }}}
" LSP: {{{
" Function for vim-lsp customization.
function! s:on_lsp_buffer_enabled() abort
	" Enabled lsp autocomplete sources to Vim native functions.
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	setlocal complete= omnifunc=lsp#complete

	" Basic keymaps for lsp servers.
  nmap <buffer> K   <plug>(lsp-hover)
  nmap <buffer> gd  <plug>(lsp-definition)
  nmap <buffer> [d  <plug>(lsp-previous-diagnostic)
  nmap <buffer> ]d  <plug>(lsp-next-diagnostic)

	" Keymaps for navigation on lsp documents.
  nnoremap <buffer> <expr><c-b> lsp#scroll(-3)
  nnoremap <buffer> <expr><c-f> lsp#scroll(+3)
	
	" Enable semantic highlight.
	let g:lsp_semantic_enabled=1
endfunction

" On lsp installed.
augroup lsp_install
  au!
  " Enabled lsp only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call <SID>on_lsp_buffer_enabled()
augroup END
" }}}
" Enfocado: {{{
" Theme style.
let g:enfocado_style='neon' " Available: `nature` or `neon`.

" Plugins enabled.
let g:enfocado_plugins=[
			\   'asyncomplete',
			\   'netrw',
			\   'plug',
			\   'vim-lsp'
			\ ]
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
Plug '~/Workspace/human.vim'
Plug '~/Workspace/nerdterm'
Plug '~/Workspace/vim-astro'

Plug 'mattn/vim-lsp-settings' |
			\ Plug 'prabirshrestha/vim-lsp' |
			\ Plug 'prabirshrestha/asyncomplete.vim' |
			\ Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug '~/Workspace/vim-enfocado'
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
" Netrw: {{{
" Toggle netrw explorer.
nmap <silent> <leader>ft <Cmd>Explore<CR>
" }}}
" Human: {{{
" Delete all buffers except the current.
nmap 1b <Plug>(BufOnly)

" Map for maximizer toggle.
nmap <C-w>m <Plug>(MaximizerToggle)

" Mappings for resizer.
nmap <M-Left>   <Plug>(ResizerLeft)
nmap <M-Down>   <Plug>(ResizerDown)
nmap <M-Up>     <Plug>(ResizerUp)
nmap <M-Right>  <Plug>(ResizerRight)
" }}}
" NERDTerm: {{{
" Toggle terminal in the bottom.
nmap <leader>tt <Plug>(NERDTermToggle)
tmap <leader>tt <Plug>(NERDTermToggle)
" }}}

