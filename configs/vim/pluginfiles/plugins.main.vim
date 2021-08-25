" -----------------------------------------------------------------------------
" Name:     plugins.main.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    Main file config for plugins settings.
" -----------------------------------------------------------------------------

" Providers settings for neovim plugins.
let g:loaded_python_provider=0
let g:loaded_python3_provider=0
let g:loaded_node_provider=0
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

" Import plugins settings files.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\plugins.settings.vim
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\settings\colors.settings.vim

" Import plugins mappings files.
source $USERPROFILE\dotfiles\configs\vim\pluginfiles\mappings\plugins.mappings.vim

call plug#begin('$LOCALAPPDATA\nvim-data\plugged\')
" Plugins.
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/neoclide/coc.nvim.git',{'branch':'release'}
Plug 'https://github.com/preservim/nerdcommenter.git'
Plug 'https://github.com/MattesGroeger/vim-bookmarks.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin.git'
Plug 'https://github.com/junegunn/fzf.git',{'do':{ -> fzf#install()}}
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'https://github.com/szw/vim-maximizer.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
" Colors.
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/overcache/NeoSolarized.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git',{'branch':'develop'}
Plug 'https://github.com/ghifarit53/tokyonight-vim.git'
call plug#end()

" Set colorscheme when all plugs, settings, and options are loaded.
colorscheme tokyonight
