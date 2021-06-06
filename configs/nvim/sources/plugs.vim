"FILE CONFIG PLUGS.VIM FOR INSTALL VIM PLUGS.

"Nvim plugs installeds:
call plug#begin(expand('~/.config/nvim/plugged'))
"-------------------------------------------------------
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'overcache/NeoSolarized'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'yggdroot/indentline'
Plug 'chrisbra/colorizer'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'townk/vim-autoclose'
"-------------------------------------------------------
call plug#end()

"by. @wuelnermartinez