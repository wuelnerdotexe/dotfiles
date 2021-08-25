" FILE CONFIG PLUGINS.MAPPINGS.VIM FOR PLUGIN MAPPINGS.

" CONQUER OF COMPLETITION MAPPINGS.
" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)
" -----------------------------------------------------------------------------
" NERDTREE MAPPINGS.
" NERDTree toggle.
nmap <silent> <leader>te :NERDTreeToggle<CR>

" NERDTree find open file.
nmap <silent> <leader>fe :NERDTreeFind<CR>
" -----------------------------------------------------------------------------
" SIGNIFY MAPPINGS.
" Show Signify hunk diff on the current line.
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>
" -----------------------------------------------------------------------------
" FUZZY FINDER MAPPINGS.
" Find with fuzzy finder.
nnoremap <silent> <leader>ff :FZF<CR>

" by. @wuelnerdotexe
