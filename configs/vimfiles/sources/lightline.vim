" FILE CONFIG LIGHTLINE.VIM FOR LIGHTLINE PLUGIN DESIGN.

" Init lightline:
let g:lightline={}

" Set the components content:
let g:lightline.component={
    \ 'tabline_name':'BUFFERS',
    \ 'editor_name':'NEOVIM'
  \ }

" Bufferline options:
let g:lightline#bufferline#unnamed='[No Name]'

" Register components:
let g:lightline.component_expand={
    \ 'buffers':'lightline#bufferline#buffers'
  \ }

" Register functions:
let g:lightline.component_function={
    \ 'gitbranch':'gitbranch#name'
  \ }

" Set color to the components:
let g:lightline.component_type={
    \ 'buffers':'tabsel',
    \ 'tabline_name':'warning'
  \ }

" Register coc components:
call lightline#coc#register()

" Add tabline with bufferline:
let g:lightline.tabline={
    \ 'left':[
    \     ['tabline_name','buffers']
  \ ],
    \ 'right':[
    \     ['editor_name']
  \ ]
  \ }

" Add active the components to lightline:
let g:lightline.active={
    \ 'left':[
    \   ['mode', 'paste'],
    \   ['gitbranch','coc_status']
  \ ],
    \ 'right':[
    \   ['coc_info','coc_hints','coc_errors','coc_warnings','coc_ok'],
    \   ['filename','lineinfo','percent']
  \ ]
  \ }

" Add inactive components to lightline:
let g:lightline.inactive={
    \ 'left':[
    \   ['coc_status']
  \ ],
    \ 'right':[
    \   ['filename','lineinfo','percent']
  \ ]
  \ }


" Set lightline theme:
let g:lightline.colorscheme='tokyonight'

" Necessary native settings:
set wildmenu
set noshowmode
set showtabline=2

" by. @wuelnermartinez
