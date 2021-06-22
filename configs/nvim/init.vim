" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.

set nocompatible

" Import general settings file:
source ~\dotfiles\configs\nvim\sources\settings.vim

" Import plugs files:
source ~\dotfiles\configs\nvim\sources\plugs.vim
source ~\dotfiles\configs\nvim\sources\nerdtree.vim
source ~\dotfiles\configs\nvim\sources\coc.vim

" Config and import themes files:
set termguicolors
syntax on
source ~\dotfiles\configs\nvim\sources\lightline.vim
source ~\dotfiles\configs\nvim\sources\nord.vim

" Import mappings file:
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" by. @wuelnermartinez
