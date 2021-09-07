" -----------------------------------------------------------------------------
" Name:     plugins.main.vim
" Author:   Wuelner Martínez <wuelnerdotexe@gmail.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT
" About:    Main file config for plugins settings.
" -----------------------------------------------------------------------------

" Import plugins settings files.
source $HOME/dotfiles/configs/vim/pluginfiles/settings/plugins.settings.vim
source $HOME/dotfiles/configs/vim/pluginfiles/settings/colors.settings.vim

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
    echo "Installing Vim-Plug..."
    silent exec "!curl -fLo " . shellescape(g:plug_file) . " --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
endif

" Set path to plugins directory.
let g:vim_plug=has('win32') ?
    \ '$HOME/AppData/Local/vim-plug/plugged/' : '$HOME/.config/vim-plug/plugged/'

" Install plugins.
call plug#begin(g:vim_plug)

" Plugins.
Plug 'https://github.com/neoclide/coc.nvim.git',{'branch' : 'release'}
Plug 'https://github.com/sheerun/vim-polyglot.git'
Plug 'https://github.com/tpope/vim-surround.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/preservim/nerdtree.git'
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/junegunn/fzf.git',{'do' : { -> fzf#install()},'on' : 'FZF'}
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/szw/vim-maximizer.git',{'on' : 'MaximizerToggle'}

" Colors.
Plug 'https://github.com/overcache/NeoSolarized.git'

call plug#end()

" Missing plugins are installed and set the colorscheme when all have loaded.
if !empty(filter(copy(g:plugs),'!isdirectory(v:val.dir)'))
    PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * ++nested colorscheme NeoSolarized

" Import plugins mappings files.
source $HOME/dotfiles/configs/vim/pluginfiles/mappings/plugins.mappings.vim
