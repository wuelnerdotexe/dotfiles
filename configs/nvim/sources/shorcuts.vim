" FILE CONFIG SHORCUTS.VIM FOR VIM MAPS AND COMMANDS.

" Prettier command and map keys:
command! -nargs=0 Prettier :CocCommand prettier.formatFile

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" by. @wuelnermartinez