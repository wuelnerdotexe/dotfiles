" FILE CONFIG LIGHTLINE.VIM FOR LIGHTLINE PLUGIN DESIGN.

" Init lightline:
let g:lightline={}

" Set the components content:
let g:lightline.component={
    \ 'tabline_name':'BUFFERS'
    \ }

" Bufferline options:
let g:lightline#bufferline#unnamed='[No Name]'

" Register all components:
let g:lightline.component_expand={
    \ 'buffers':'lightline#bufferline#buffers'
    \ }

" Set color to the components:
let g:lightline.component_type={
    \ 'buffers':'tabsel'
    \ }

" Register coc components:
call lightline#coc#register()

" Add tabline with bufferline:
let g:lightline.tabline={
    \ 'left':[['buffers']],
    \ 'right':[['tabline_name']]
    \ }

" Add the components to the lightline:
let g:lightline.active={
    \ 'left':[['mode', 'paste'],
    \         ['coc_info','coc_hints','coc_errors','coc_warnings','coc_ok'],
    \         ['coc_status'],
    \         ['readonly','filename','modified']],
    \ 'right':[['lineinfo'],
    \          ['percent'],
    \          ['filetype']]
    \ }

" Set lightline theme:
let g:lightline.colorscheme='gruvbox'

" Necessary native settings:
set wildmenu
set noshowmode
set showtabline=2

" by. @wuelnermartinez
