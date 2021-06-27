" FILE CONFIG COC.VIM FOR CONQUER OF COMPLETITION PLUGIN AJUSTS.

" Install coc extensions.
let g:coc_global_extensions = [
			\ 'coc-bootstrap-classname',
			\ 'coc-css',
			\ 'coc-cssmodules',
			\ 'coc-highlight',
			\ 'coc-html',
			\ 'coc-htmlhint',
			\ 'coc-json',
			\ 'coc-pairs',
			\ 'coc-prettier',
			\ 'coc-snippets',
			\ 'coc-tsserver'
			\ ]

" Ale integration with coc:
let g:ale_disable_lsp=1

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting code:
nnoremap <silent> <leader>p :CocCommand prettier.formatFile<CR>

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" by. @wuelnermartinez