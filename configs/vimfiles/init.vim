" FILE CONFIG _VIMRC FOR VIM SETTINGS.

" Powershell is set as the default shell:
set shell=powershell

" The space key is set as leader:
let mapleader=" "

" Import general settings files:
source $USERPROFILE\dotfiles\configs\vimfiles\sources\settings.vim

" Import runtime plugs file:
source $USERPROFILE\dotfiles\configs\vimfiles\sources\plugs.vim

" Import plug settings files:
source $USERPROFILE\dotfiles\configs\vimfiles\sources\nerdtree.vim
source $USERPROFILE\dotfiles\configs\vimfiles\sources\coc.vim
source $USERPROFILE\dotfiles\configs\vimfiles\sources\lightline.vim
source $USERPROFILE\dotfiles\configs\vimfiles\sources\gruvbox.vim
source $USERPROFILE\dotfiles\configs\vimfiles\sources\nord.vim

" Import user mappings file:
source $USERPROFILE\dotfiles\configs\vimfiles\sources\key-maps.vim

" Set lightline theme:
let g:lightline.colorscheme='gruvbox'

" Set vim theme when all plugs load:
colorscheme gruvbox

" by. @wuelnermartinez
