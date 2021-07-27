" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Vim plugs installeds:
call plug#begin('$LOCALAPPDATA\nvim-data\plugged\')
" -------------------------------------------------------
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'josa42/vim-lightline-coc'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'szw/vim-maximizer'
" -------------------------------------------------------
call plug#end()

" by. @wuelnermartinez
