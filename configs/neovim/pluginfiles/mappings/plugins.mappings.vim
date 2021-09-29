" -----------------------------------------------------------------------------
" Name:     plugins.mappings.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    File config for plugins mappings.
" -----------------------------------------------------------------------------

" Coc make <CR> auto-select the first completion item and notify to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Coc use tab for trigger completion with characters ahead and navigate.
inoremap <silent> <expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~#'\s'
endfunction

" Coc use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'],&filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!'.&keywordprg." ".expand('<cword>')
    endif
endfunction

" Coc remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Coc GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc remap keys for applying codeAction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Coc apply AutoFix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Coc add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Fuzzy finder activate.
nnoremap <silent> <leader>ff :FZF<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm :MaximizerToggle<CR>

" NERDTree toggle.
nnoremap <silent> <leader>te :NERDTreeToggle<CR>

" NERDTree find open file.
nnoremap <silent> <leader>fe :NERDTreeFind<CR>

" Signify show hunk diff on the current line.
nnoremap <silent> <leader>hd :SignifyHunkDiff<CR>
