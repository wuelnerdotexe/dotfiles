"FILE CONFIG SETTINGS.VIM FOR VIM GENERAL AJUSTS.

"Nvim providers settings:
let g:loaded_python_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_perl_provider = 0
let g:python3_host_prog = 'C:/Python39/python.exe'

"Vim interfaz settings:
set fillchars+=vert:•
set number relativenumber
set cursorline
set laststatus=2
set noshowmode

"Vim coding settings:
syntax on
set autoindent
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set nowrap

"Vim search settings:
set hlsearch
set ignorecase
set incsearch

"Auto init commands:
autocmd VimEnter * NERDTree

"User commands
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"by. @wuelnermartinez
