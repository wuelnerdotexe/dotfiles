" FILE CONFIG PLUGINS.SETTINGS.VIM FOR PLUGIN SETTINGS.

" CONQUER OF COMPLETITION SETTINGS.
" Install coc extensions.
let g:coc_global_extensions=[
    \ 'coc-marketplace',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    \ 'coc-tabnine',
    \ 'coc-vimlsp'
  \ ]

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1]=~# '\s'
endfunction

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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" -----------------------------------------------------------------------------
" NERDTREE SETTINGS.
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
" -----------------------------------------------------------------------------
" AIRLINE SETTINGS.
" No show vim native mode.
set noshowmode

" Airline extensions settings.
let g:airline_extensions=(['bookmark','branch','coc','hunks','tabline','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline section settings.
let g:airline_section_c='%f'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%y'

" Airline font/symbols settings.
let g:airline_symbols_ascii=1

" by. @wuelnerdotexe
