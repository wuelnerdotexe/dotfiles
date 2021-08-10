" FILE CONFIG AIRLINE.SETTINGS.VIM FOR AIRLINE PLUGIN SETTINGS.

" No show vim native mode.
set noshowmode

" Airline extensions settings.
let g:airline_extensions=(['bookmark','coc','hunks','tabline','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline section settings.
let g:airline_section_c='%t'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%y'

" Airline font/symbols settings.
let g:airline_symbols_ascii=1

" by. @wuelnerdotexe
