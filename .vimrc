set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s,>,<,[,],~
set mouse=
syntax on
set nohlsearch
highlight StatusLine ctermfg=black ctermbg=grey
highlight CursorLine ctermfg=none ctermbg=darkgrey cterm=none
highlight MatchParen ctermfg=none ctermbg=darkgrey 
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE
set laststatus=2
set statusline=%F%r%h%=
set number
set incsearch
set ignorecase
set wildmenu wildmode=list:full
set expandtab
set shiftwidth=2
set autoindent
set smartindent
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>
nmap <silent> <C-n> 	  :update<CR>:bn<CR>
imap <silent> <C-n> <ESC> :update<CR>:bn<CR>
vmap <silent> <C-n> <ESC> :update<CR>:bn<CR>
cmap <silent> <C-n> <ESC> :update<CR>:bn<CR> 

hi Comment ctermfg=9
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

imap <C-b> <ESC>:read ~/.vim/bf<CR>i
nmap <C-b> :read ~/.vim/bf<CR>
vmap <C-b> "w!~/.vim/bf<CR>
