"FILE CONFIG SETTINGS.VIM FOR VIM GENERAL AJUSTS.

"Nvim interfaz settings:
set fillchars+=vert:•
set number relativenumber
set cursorline
set laststatus=2

"Nvim coding settings:
syntax on
set autoindent
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4
set nowrap

"Nvim search settings:
set hlsearch
set ignorecase
set incsearch

"Auto init commands:
autocmd VimEnter * NERDTree

"User commands
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

"by. @wuelnermartinez
