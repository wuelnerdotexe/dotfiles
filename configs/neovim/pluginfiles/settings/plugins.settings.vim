" -----------------------------------------------------------------------------
" Name:     plugins.settings.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    File config for plugins settings.
" -----------------------------------------------------------------------------

" Coc extensions.
let g:coc_global_extensions=[
    \ 'coc-eslint',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-tsserver'
  \ ]

" NERDTree interfaz.
let g:NERDTreeMinimalUI=1
let g:NERDTreeStatusline='explorer'

" NERDTree operation.
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\.git$','\.svn$','\.hg$','\CSV$','\.DS_Store$','\Thumbs.db$']

" NERDTree interaction.
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1

" Airline font/symbols.
let g:airline_powerline_fonts=1

" Airline extensions.
let g:airline_extensions=(['tabline','netrw','branch','hunks','coc','term','fzf'])
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#branch#custom_head='gitbranch#name'
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let g:airline_section_c='%t'
let g:airline_section_z='L%l'
let g:airline_section_y='%{&fenc?&fenc:&enc}[%{&ff}] %{SleuthIndicator()}'
let g:airline_section_x='%{&filetype}'
let g:airline#extensions#default#section_truncate_width={
    \ 'b' : 100,
    \ 'y' : 100,
    \ 'x' : 100,
    \ 'error' : 100,
    \ 'warning' : 100
  \ }

" Airline theme.
let g:airline_theme="enfocado"
