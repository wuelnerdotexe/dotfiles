" FILE CONFIG GINIT.VIM FOR NEOVIM-QT SETTINGS.

set nocompatible

" Import general settings file:
source ~\dotfiles\configs\nvim\sources\settings.vim

" Import plugs files:
source ~\dotfiles\configs\nvim\sources\plugs.vim
source ~\dotfiles\configs\nvim\sources\nerdtree.vim
source ~\dotfiles\configs\nvim\sources\coc.vim

" Neovim-qt recommended settings:
GuiFont! Jetbrains Mono NL:h11
GuiTabline 0
GuiPopupmenu 0

" Config and import themes files:
set t_Co=256
syntax on
source ~\dotfiles\configs\nvim\sources\lightline.vim
source ~\dotfiles\configs\nvim\sources\nord.vim

" Import mappings file:
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" by. @wuelnermartinez
