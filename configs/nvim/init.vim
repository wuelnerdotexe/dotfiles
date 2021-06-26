" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.

set nocompatible

" Import general settings file:
source ~\dotfiles\configs\nvim\sources\settings.vim

" Import plugs files:
source ~\dotfiles\configs\nvim\sources\plugs.vim
source ~\dotfiles\configs\nvim\sources\nerdtree.vim
source ~\dotfiles\configs\nvim\sources\coc.vim

" Config and import themes files:
source ~\dotfiles\configs\nvim\sources\theme.vim
source ~\dotfiles\configs\nvim\sources\lightline.vim
source ~\dotfiles\configs\nvim\sources\horizon.vim

" Import mappings file:
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" Map Key for reload nvim settings:
nnoremap <silent> <Leader><Leader> :source ~\AppData\Local\nvim\init.vim<CR>

" by. @wuelnermartinez
