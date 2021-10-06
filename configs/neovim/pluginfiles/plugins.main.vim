" -----------------------------------------------------------------------------
" Name:     plugins.main.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    Main file config for plugins settings.
" -----------------------------------------------------------------------------

" Import plugins settings files.
runtime pluginfiles/settings/plugins.settings.vim

" Providers settings for neovim plugins.
if has('nvim')
    let g:loaded_ruby_provider=0
    let g:loaded_perl_provider=0

    " IMPORTANT: These settings depend on each user because the installation
    " is different depending on the OS, the package manager, and the Python
    " version. In my case I have Python3 installed on Windows using scoop. 
    let g:loaded_python_provider=0
    let g:python3_host_prog='$HOME/scoop/apps/python/current/python.exe'

endif

" Set path to vim-plug file.
if has('nvim')
    let g:plug_file=stdpath('data').'/site/autoload/plug.vim'
else
    let g:plug_file=has('win32') ?
        \ '$HOME/vimfiles/autoload/plug.vim' : '$HOME/.vim/autoload/plug.vim'
endif

" Automatic installation of Vim-Plug only if it is not installed.
if empty(glob(g:plug_file))
    echomsg "Installing vim-plug..."
    silent exec "!curl -fLo " . shellescape(g:plug_file) . " --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Set path to plugins directory.
let g:vim_plug=has('win32') ?
    \ '$HOME/AppData/Local/vim-plug/plugged/' : '$HOME/.config/vim-plug/plugged/'

" Install plugins.
call plug#begin(g:vim_plug)

" Files.
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/junegunn/fzf.git',{'do' : { -> fzf#install()}}

" Coding.
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter',{'do' : ':TSUpdate'}
endif
Plug 'neoclide/coc.nvim',{'branch' : 'release'}
Plug 'tpope/vim-commentary'
Plug 'AndrewRadev/tagalong.vim'
Plug 'shime/vim-livedown'

" Tools.
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'mg979/vim-visual-multi',{'branch' : 'master'}
Plug 'szw/vim-maximizer',{'on' : 'MaximizerToggle'}

" Statusline.
Plug 'itchyny/vim-gitbranch'
Plug 'vim-airline/vim-airline'

" Icons.
Plug 'ryanoasis/vim-devicons'

" Colors.
Plug 'wuelnerdotexe/vim-enfocado',{'branch' : 'development'}

call plug#end()

" Missing plugins are installed.
if !empty(filter(copy(g:plugs),'!isdirectory(v:val.dir)'))
    echomsg "Installing missing plugs..."
    PlugInstall --sync | source $MYVIMRC
endif

" Enable the colorscheme when everything has loaded.
autocmd VimEnter * ++nested colorscheme enfocado

" Import plugins mappings files.
runtime pluginfiles/mappings/plugins.mappings.vim
