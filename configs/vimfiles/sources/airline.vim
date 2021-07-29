" FILE CONFIG AIRLINE.VIM FOR AIRLINE PLUGIN SETTINGS.

" Airline extensions settings:
let g:airline_extensions=(['bookmark','coc','hunks','tabline','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline section settings:
let g:airline_section_c='%t'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%y'

" Airline font/symbols settings:
 let g:airline_symbols_ascii=1

" Necessary native settings:
set wildmenu
set noshowmode
set showtabline=2

" by. @wuelnermartinez
