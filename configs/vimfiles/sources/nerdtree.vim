" FILE CONFIG NERDTREE.VIM FOR NERDTREE PLUGIN AJUSTS.

" NERDTree interfaz settings:
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeStatusline='NERDTREE | WORKING DIRECTORY'

" Start NERDTree when Vim starts with a directory argument:
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" NERDTree interaction settings:
let NERDTreeQuitOnOpen=1

" Exit Vim if NERDTree is the only window left:
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Maps for NERDTree:
nnoremap <silent> <leader>e :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" by. @wuelnermartinez
