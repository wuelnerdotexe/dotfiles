" -----------------------------------------------------------------------------
" Name:     plugins.mappings.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    File config for plugins mappings.
" -----------------------------------------------------------------------------

" Coc use tab for trigger completion with characters ahead and navigate.
inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

" Coc GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Coc symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Coc apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" NERDTree toggle.
nnoremap <silent> <leader>te :NERDTreeToggle<CR>

" NERDTree find open file.
nnoremap <silent> <leader>fe :NERDTreeFind<CR>

" Sygnify show hunk diff on the current line.
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>

" Fuzzy finder activate.
nnoremap <silent> <leader>ff :FZF<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm :MaximizerToggle<CR>
