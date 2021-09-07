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
    \ 'coc-pairs',
    \ 'coc-tabnine',
    \ 'coc-vimlsp'
  \ ]

" NERDTree interfaz.
let NERDTreeMinimalUI=1
let g:NERDTreeStatusline='files'
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let NERDTreeShowHidden=1

" NERDTree interaction.
let NERDTreeQuitOnOpen=1

" Airline tabline.
set showtabline=2

" Airline extensions.
let g:airline_extensions=(['tabline','hunks','coc','term'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let g:airline_skip_empty_sections=1
let g:airline_section_c='%t'
let g:airline_section_z='%l/%L'
let g:airline_section_y='%p%%'
let g:airline_section_x='%y'

" Airline font/symbols.
let g:airline_powerline_fonts=1

" Airline already shows current mode.
set noshowmode
