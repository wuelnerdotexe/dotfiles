" FILE CONFIG GINIT.VIM FOR NEOVIM-QT SETTINGS.

set nocompatible

" Neovim-qt recommended settings:
set mouse=a

if exists(':GuiFont')
    GuiFont! Jetbrains Mono NL:h11
endif

if exists(':GuiTabline')
    GuiTabline 0
endif

if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

if exists(':GuiScrollBar')
    GuiScrollBar 1
endif

nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv

" Import config files:
source ~\dotfiles\configs\nvim\sources\settings.vim
source ~\dotfiles\configs\nvim\sources\plugs.vim
source ~\dotfiles\configs\nvim\sources\nerdtree.vim
source ~\dotfiles\configs\nvim\sources\lightline.vim
source ~\dotfiles\configs\nvim\sources\coc.vim
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" Set theme:
set t_Co=256
syntax on
source ~\dotfiles\configs\nvim\sources\nord.vim

" by. @wuelnermartinez
