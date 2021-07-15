" FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

" Vim plugs installeds:
call plug#begin('$LOCALAPPDATA\nvim-data\plugged\')
" -------------------------------------------------------
Plug 'preservim/nerdtree' |
			\ Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'itchyny/lightline.vim' |
            \ Plug 'itchyny/vim-gitbranch' |
			\ Plug 'mengelbrecht/lightline-bufferline' |
            \ Plug 'josa42/vim-lightline-coc'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tpope/vim-commentary'

Plug 'mhinz/vim-signify'

Plug 'szw/vim-maximizer'

Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
" -------------------------------------------------------
call plug#end()

" by. @wuelnermartinez
