" FILE CONFIG KEY-MAPS.VIM FOR VIM KEY MAPPINGS.

" Buffers map keys:
nnoremap <silent> <leader>h :bprev<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>d :bdelete<CR>

" Signify map keys:
nnoremap <silent> <leader>s :SignifyHunkDiff<CR>

" Maximizer map keys:
nnoremap <silent> <leader>m :MaximizerToggle<CR>

" Fuzzy Finder map keys:
command! -bang ProjectFiles call fzf#vim#files('getcwd()', <bang>0)
nnoremap <silent> <leader>f :Files<CR>

" by. @wuelnermartinez
