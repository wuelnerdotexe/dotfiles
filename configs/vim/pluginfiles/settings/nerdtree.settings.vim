" FILE CONFIG NERDTREE.SETTINGS.VIM FOR NERDTREE PLUGIN AJUSTS.

" NERDTree interfaz settings.
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeStatusline='NERDTree | working directory'

" NERDTree interaction settings.
let NERDTreeQuitOnOpen=1

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Maps for NERDTree.
nmap <silent> <leader>e :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

" by. @wuelnerdotexe
