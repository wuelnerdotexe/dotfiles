" FILE CONFIG KEY-MAPS.VIM FOR VIM KEY MAPPINGS.

" Buffers map keys:
nnoremap <silent> <leader>h :bprev<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>d :bdelete<CR>

" Signify map keys:
nnoremap <silent> <leader>s :SignifyHunkDiff<CR>

" Map Key for reload nvim settings:
nnoremap <silent> <Leader><Leader> :source ~\_vimrc<CR>

" by. @wuelnermartinez
