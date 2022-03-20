" vim: fileencoding=utf-8 tabstop=2 shiftwidth=2 foldlevel=0 foldmethod=marker:
" -----------------------------------------------------------------------------
" Name:     MYVIMRC
" Author:   Wuelner Martínez <wuelner.martinez@outlook.com>
" URL:      https://github.com/wuelnerdotexe/dotfiles
" License:  MIT (C) Wuelner Martínez.
" About:    Minimal Neovim config.
" -----------------------------------------------------------------------------

" Encoding.
set encoding=utf-8

" Languages.
set spelllang=en,es
set helplang=en,es
set spell

" Colors.
set t_Co=256
set termguicolors
set background=dark

" Files.
set nobackup
set nowritebackup
set swapfile
set undofile
set autoread
set hidden

" Coding.
set nowrap
set conceallevel=2
set concealcursor=c
set shiftround
set autoindent
set breakindent
set showmatch
set matchpairs+=<:>
set nojoinspaces
set emoji

" Interfaz.
set notitle
set list
set nonumber
set norelativenumber
set numberwidth=5
set cursorline
set noruler                                    " Disabled for best performance.
set pumheight=15
set pumwidth=15
set cmdheight=1
set cmdwinheight=15
set wildmenu
set wildignorecase
set noshowcmd                                  " Disabled for best performance.
set noshowmode
set signcolumn=yes:2

" Statusline.
set laststatus=2
set showtabline=2

" Search.
set hlsearch
set incsearch
set ignorecase
set nosmartcase
set wildignore+=**/.git,**/.svn,**/.hg,**/CVS,**/.DS_store
set wildignore+=**/node_modules,**/bower_components
set wildignorecase

" Substitute.
set inccommand=nosplit

" Interaction.
set belloff=all
set confirm
set ttimeout
set ttimeoutlen=50
set complete-=i                                " Disabled for best performance.
set history=50
set shortmess+=IF
set shortmess-=S
set scroll=0
set scrolloff=0
set sidescroll=0
set sidescrolloff=0
set splitright
set splitbelow
set equalalways
set backspace=indent,eol,start
set clipboard=unnamedplus
set mouse=a

" Performance.
set synmaxcol=220
set updatetime=100
set redrawtime=1500
set nolazyredraw
set ttyfast

" Filetype and syntax.
filetype plugin indent on | syntax on
" -----------------------------------------------------------------------------
" SECTION: Plugins settings.
" -----------------------------------------------------------------------------
" It is indicated that the comma key will be the `<leader>` key.
let g:mapleader=','

" Coc extensions.
let g:coc_global_extensions=[
  \ 'coc-css',
  \ 'coc-eslint',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-lua',
  \ 'coc-tsserver',
  \ 'coc-vimlsp'
  \ ]

" Coc syntax.
let g:coc_default_semantic_highlight_groups=1

" Rainbow activate.
let g:rainbow_active=1

" Rainbow config.
let g:rainbow_conf={
  \ 'separately': {
      \ 'html': 0
      \ }
  \ }

" IndentLine color.
let g:indentLine_setColors=0

" IndentLine conceal.
let g:indentLine_setConceal=0

" IndentLine excludes.
let g:indentLine_fileTypeExclude=['text', 'sh']
let g:indentLine_bufTypeExclude=['help', 'terminal']
let g:indentLine_bufNameExclude=['_.*', 'NERD_tree.*']

" IndentLine chars.
let g:indentLine_first_char='▏'
let g:indentLine_char='▏'

" IndentLine level.
let g:indentLine_showFirstIndentLevel=1

" Matchit disable.
let g:loaded_matchit=1

" Match-up off-screen.
let g:matchup_matchparen_offscreen={ 'method': 'popup' }

" Gitgutter messages.
let g:gitgutter_show_msg_on_hunk_jumping=1

" Gitgutter signs.
let g:gitgutter_sign_added='▎'
let g:gitgutter_sign_modified='▎'
let g:gitgutter_sign_removed='▁'
let g:gitgutter_sign_removed_first_line='▔'
let g:gitgutter_sign_removed_above_and_below='▎'
let g:gitgutter_sign_modified_removed='▎'

" NERDTree replace netrw.
let g:NERDTreeHijackNetrw=1

" NERDTree interfaz.
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='●'
let g:NERDTreeDirArrowCollapsible='○'
let g:NERDTreeStatusline='explorer'

" NERDTree operation.
let g:NERDTreeMarkBookmarks=0
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore=[
  \ '\.git$',
  \ '\.svn$',
  \ '\.hg$',
  \ '\CSV$',
  \ '\.DS_Store$',
  \ '\Thumbs.db$'
  \ ]

" NERDTree interaction.
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeAutoDeleteBuffer=1

" Airline font/symbols.
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_powerline_fonts=1

" Airline extensions.
let g:airline_extensions=([
  \ 'branch',
  \ 'coc',
  \ 'fzf',
  \ 'hunks',
  \ 'tabline',
  \ 'term',
  \ 'whitespace'
  \ ])
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#hunks#non_zero_only=1

" Airline sections.
let g:airline_section_c='%t %{get(b:,"coc_current_function","")}'
let g:airline_section_z='L%l'
let g:airline_section_y='%{&fenc?&fenc:&enc}[%{&ff}] %{SleuthIndicator()}'
let g:airline_section_x='%{&filetype}'
let g:airline#extensions#default#section_truncate_width={
  \ 'b': 100,
  \ 'y': 100,
  \ 'x': 100,
  \ 'error': 100,
  \ 'warning': 100
  \ }

" Airline theme.
let g:airline_theme='enfocado'

" Enfocado theme.
let g:enfocado_style='nature' " Available: `nature` or `neon`.
let g:enfocado_plugins=[
  \ 'coc',
  \ 'copilot',
  \ 'fzf',
  \ 'gitgutter',
  \ 'matchup',
  \ 'nerdtree',
  \ 'plug',
  \ 'rainbow',
  \ 'yank'
  \ ]

" CursorHold updatetime.
let g:cursorhold_updatetime=100
" -----------------------------------------------------------------------------
" SECTION: Plugins main.
" -----------------------------------------------------------------------------
" Providers settings for neovim plugins.
let g:loaded_ruby_provider=0
let g:loaded_perl_provider=0

" IMPORTANT: These settings depend on each user because the installation
" is different depending on the OS, the package manager, and the Python
" version. In my case I have Python3 installed on Windows using scoop.
let g:loaded_python_provider=0

" Install plugins.
call plug#begin(stdpath('data') . '/plugged')

" IDE.
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'luochen1990/rainbow'
Plug 'Yggdroot/indentLine'
Plug 'andymass/vim-matchup'
Plug 'github/copilot.vim'

" Typing.
Plug 'mg979/vim-visual-multi', { 'branch': 'master' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'matze/vim-move'
Plug 'machakann/vim-highlightedyank'

" Git.
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Files.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'preservim/nerdtree'

" Interfaz.
Plug 'vim-airline/vim-airline'
Plug 'wuelnerdotexe/vim-enfocado', { 'branch': 'development' }

" Tools.
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'szw/vim-maximizer'
Plug 'iamcco/markdown-preview.nvim',
      \ { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug'] }
call plug#end()
" -----------------------------------------------------------------------------
" SECTION: Native mappings.
" -----------------------------------------------------------------------------
" Move previous/left with buffers.
nnoremap <silent> gB <Cmd>bprev<CR>
nnoremap <silent> <S-PageUp> <Cmd>bprev<CR>
inoremap <silent> <S-PageUp> <Cmd>bprev<CR>

" Move next/right with buffers.
nnoremap <silent> gb <Cmd>bnext<CR>
nnoremap <silent> <S-PageDown> <Cmd>bnext<CR>
inoremap <silent> <S-PageDown> <Cmd>bnext<CR>

" Resize splits.
nnoremap <silent> <C-H> 1<C-W><
nnoremap <silent> <C-K> 1<C-W>+
nnoremap <silent> <C-L> 1<C-W>>
nnoremap <silent> <C-J> 1<C-W>-
" -----------------------------------------------------------------------------
" SECTION: Plugins mappings.
" -----------------------------------------------------------------------------
" Coc remap `<C-F>` and `<C-B>` for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-F> coc#float#has_scroll() ?
      \ coc#float#scroll(1) : "\<C-F>"
nnoremap <silent><nowait><expr> <C-B> coc#float#has_scroll() ?
      \ coc#float#scroll(0) : "\<C-B>"
inoremap <silent><nowait><expr> <C-F> coc#float#has_scroll() ?
      \ "\<C-R>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-B> coc#float#has_scroll() ?
      \ "\<C-R>=coc#float#scroll(0)\<CR>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-F> coc#float#has_scroll() ?
      \ coc#float#scroll(1) : "\<C-F>"
vnoremap <silent><nowait><expr> <C-B> coc#float#has_scroll() ?
      \ coc#float#scroll(0) : "\<C-B>"

" Coc make `<CR>` auto-select the first completion item and notify to
" format on enter, `<CR>` could be remapped by other vim plugin.
inoremap <silent><expr> <CR> pumvisible() ?
      \ coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Coc use `<C-Space>` to trigger completion.
inoremap <silent><expr> <C-Space> coc#refresh()

" Coc use `<TAB>` for trigger completion with characters ahead and navigate.
inoremap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-N>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-P>" : "\<C-H>"

function! s:check_back_space() abort
  let col=col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Coc use `[g` and `]g` to navigate diagnostics.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Coc go to code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Coc use `K` to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'],&filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!'.&keywordprg." ".expand('<cword>')
  endif
endfunction

" Coc use `CTRL-S` for selections ranges.
nmap <silent> <C-S> <Plug>(coc-range-select)
xmap <silent> <C-S> <Plug>(coc-range-select)

" Coc add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Coc add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Coc add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Coc formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Coc remap keys for applying codeaction to the current buffer.
nmap <leader>ac <Plug>(coc-codeaction)

" Coc apply autofix to problem on the current line.
nmap <leader>qf <Plug>(coc-fix-current)

" Coc run the codelens action on the current line.
nmap <leader>cl <Plug>(coc-codelens-action)

" Coc applying codeaction to the selected region.
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Coc map function and class text objects.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Coc show all diagnostics.
nnoremap <silent><nowait> <Space>a :<C-U>CocList diagnostics<CR>

" Coc manage extensions.
nnoremap <silent><nowait> <Space>e :<C-U>CocList extensions<CR>

" Coc show commands.
nnoremap <silent><nowait> <Space>c :<C-U>CocList commands<CR>

" Coc find symbol of current document.
nnoremap <silent><nowait> <Space>o :<C-U>CocList outline<CR>

" Coc search workspace symbols.
nnoremap <silent><nowait> <Space>s :<C-U>CocList -I symbols<CR>

" Coc do default action for next item.
nnoremap <silent><nowait> <Space>j :<C-U>CocNext<CR>

" Coc do default action for previous item.
nnoremap <silent><nowait> <Space>k :<C-U>CocPrev<CR>

" Coc resume latest coc list.
nnoremap <silent><nowait> <Space>p :<C-U>CocListResume<CR>

" Fuzzy finder activate.
nnoremap <silent> <leader>ff <Cmd>FZF<CR>

" Maximizer toggle.
nnoremap <silent> <leader>tm <Cmd>MaximizerToggle<CR>

" NERDTree toggle.
nnoremap <silent> <leader>te <Cmd>NERDTreeToggle<CR>

" NERDTree find open file.
nnoremap <silent> <leader>fe <Cmd>NERDTreeFind<CR>

" Signify show hunk diff on the current line.
nnoremap <silent> <leader>hd <Cmd>SignifyHunkDiff<CR>

" Reload MY VIMRC.
nnoremap <silent> <leader>rc <Cmd>source $MYVIMRC<CR>
" -----------------------------------------------------------------------------
" SECTION: Native autocmds.
" -----------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   execute "normal! g`\""
      \ | endif
" -----------------------------------------------------------------------------
" SECTION: Plugins autocmds.
" -----------------------------------------------------------------------------
" Coc highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Coc setup formatexpr specified filetype(s).
autocmd FileType typescript,json setlocal formatexpr=CocAction('formatSelected')

" Coc update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Set Enfocado colorscheme when all have loaded.
autocmd VimEnter * ++nested colorscheme enfocado
augroup enfocado_customization
  autocmd!
    autocmd ColorScheme enfocado highlight! Normal ctermbg=NONE guibg=NONE
    autocmd ColorScheme enfocado highlight! NormalNC ctermbg=NONE guibg=NONE
augroup END
