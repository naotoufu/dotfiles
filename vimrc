set nocompatible number hlsearch nowrapscan hidden
set history=200
set shiftwidth=4 softtabstop=4 expandtab autoindent
filetype plugin on
syntax on
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

nnoremap <Leader>n nzz
nnoremap <Leader>N Nzz
cnoremap <expr> %% getcmdtype() ==':' ? expand('%;h').'/' : '%%'

if has ("autocmd")
   autocmd Filetype javascript setlocal omnifunc=javascriptcomplete#CompleteJS
endif
"colorscheme evening
colorscheme desert
