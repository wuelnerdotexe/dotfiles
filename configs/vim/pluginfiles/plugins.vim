" FILE CONFIG PLUGINS.VIM FOR VIM-PLUG SETTINGS.

" Providers setting for neovim plugins.
let g:loaded_python_provider=0
let g:loaded_python3_provider=0
let g:loaded_node_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

" Vim plugins installed with vim-plug.
call plug#begin('$LOCALAPPDATA\nvim-data\plugged\')
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/neoclide/coc.nvim.git',{'branch':'release'}
Plug 'https://github.com/preservim/nerdcommenter.git'
Plug 'https://github.com/MattesGroeger/vim-bookmarks.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git',{'branch':'develop'}
Plug 'https://github.com/ghifarit53/tokyonight-vim.git'
Plug 'https://github.com/szw/vim-maximizer.git'
call plug#end()

" Import plugin configuration files.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\coc.settings.vim
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\nerdtree.settings.vim
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\airline.settings.vim
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\gruvbox.settings.vim
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\nord.settings.vim
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\tokyonight.settings.vim

" Set colorscheme when all plugs, settings, and options are loaded.
colorscheme tokyonight

" by. @wuelnerdotexe
