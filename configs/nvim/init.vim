" FILE CONFIG INIT.VIM FOR NEOVIM SETTINGS.

set nocompatible

" Import config files:
source ~\dotfiles\configs\nvim\sources\settings.vim
source ~\dotfiles\configs\nvim\sources\plugs.vim
source ~\dotfiles\configs\nvim\sources\nerdtree.vim
source ~\dotfiles\configs\nvim\sources\lightline.vim
source ~\dotfiles\configs\nvim\sources\coc.vim
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" Set theme:
set termguicolors
syntax on
source ~\dotfiles\configs\nvim\sources\nord.vim

" by. @wuelnermartinez
