" FILE CONFIG GUI.VIM FOR DIFERENT GUI VIM SETTINGS.

" Sólo si está corriendo gVIM:
if has('gui_running')
    set guifont=Meslo\ LG\ S\ DZ:h9:b
    set guioptions-=e
    set guioptions-=m
    set guioptions-=L
    set guioptions-=r
    set guioptions-=T
endif

" by. @wuelnermartinez
