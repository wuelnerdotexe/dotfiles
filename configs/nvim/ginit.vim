" FILE CONFIG GINIT.VIM FOR NEOVIM-QT SETTINGS.

set nocompatible

" Import general settings file:
source ~\dotfiles\configs\nvim\sources\settings.vim

" Import plugs files:
source ~\dotfiles\configs\nvim\sources\plugs.vim
source ~\dotfiles\configs\nvim\sources\nerdtree.vim
source ~\dotfiles\configs\nvim\sources\coc.vim

" Neovim-qt recommended settings:
GuiFont! SFMono Nerd Font:h11
GuiTabline 0
GuiPopupmenu 0

" Config and import themes files:
source ~\dotfiles\configs\nvim\sources\theme.vim
source ~\dotfiles\configs\nvim\sources\lightline.vim
source ~\dotfiles\configs\nvim\sources\tokyonight.vim

" Import mappings file:
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" Map Key for reload nvim-qt settings:
nnoremap <silent> <Leader><Leader> :source ~\AppData\Local\nvim\ginit.vim<cr>

" by. @wuelnermartinez
