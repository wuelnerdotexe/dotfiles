" FILE CONFIG LIGHTLINE.VIM FOR LIGHTLINE PLUGIN DESIGN.

" Status bar settings:
set showtabline=2
set noshowmode
let g:lightline#bufferline#unnamed = '[No Name]'

" Set theme:
let g:lightline = {
      \  'colorscheme': 'gruvbox'
      \ }

" Add tabline with bufferline:
let g:lightline.tabline = {
      \     'left': [ ['buffers'] ],
      \     'right': [ ['tabline_name'] ]
	  \ }

" Add the components to the lightline:
let g:lightline.active = {
      \     'left':  [ [ 'mode', 'paste' ],
      \                [ 'readonly', 'filename', 'modified' ] ],
      \     'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
      \                [ 'lineinfo' ],
      \                [ 'percent' ],
      \                [ 'filetype'] ]
      \ }

" Set the components content:
let g:lightline.component = {
      \ 'editor': 'NEOVIM',
      \ 'tabline_name': 'BUFFERS'
	  \ }

" Set the components type:
let g:lightline.component_type = {
      \     'buffers': 'tabsel',
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

" Set the components expand:
let g:lightline.component_expand = {
      \  'buffers': 'lightline#bufferline#buffers',
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_infos': 'lightline#ale#infos',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

" by. @wuelnermartinez
