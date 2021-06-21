" FILE CONFIG GINIT.VIM FOR NEOVIM-QT SETTINGS.

" Neovim-qt recommended settings:
set nocompatible
set mouse=a

if exists(':GuiFont')
    GuiFont! Jetbrains Mono NL:h13
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
source ~\dotfiles\configs\nvim\sources\theme.vim
source ~\dotfiles\configs\nvim\sources\auto-cmds.vim
source ~\dotfiles\configs\nvim\sources\key-maps.vim

" by. @wuelnermartinez
