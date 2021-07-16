" FILE CONFIG _VIMRC FOR VIM SETTINGS.

" Required setting to use custom options: 
set nocompatible

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

" Vim general color settings:
set termguicolors
set t_Co=16
set background=dark
syntax on

" Set vim theme when all plugs load:
colorscheme nord

" by. @wuelnermartinez
