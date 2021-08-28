" -----------------------------------------------------------------------------
" Name:     plugins.settings.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    File config for plugins settings.
" -----------------------------------------------------------------------------

" Coc extensions.
let g:coc_global_extensions=[
    \ 'coc-marketplace',
    \ 'coc-highlight',
    \ 'coc-json',
    \ 'coc-markdownlint',
    \ 'coc-pairs',
    \ 'coc-tabnine',
    \ 'coc-vimlsp'
  \ ]

" Coc highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" NERDTree interfaz.
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let g:NERDTreeStatusline='working directory'

" NERDTree interaction.
let NERDTreeQuitOnOpen=1

" NERDTree exit vim if is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Airline extensions.
let g:airline_extensions=(['branch','coc','hunks','tabline','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let w:airline_skip_empty_sections=1
let g:airline_section_c='%t'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%Y'

" Airline font/symbols.
let g:airline_symbols_ascii=1
let g:airline_powerline_fonts=1
