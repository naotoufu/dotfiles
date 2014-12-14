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
set fileformats=unix,dos,mac

"imap <C-b> <ESC>:read ~/.vim/bf<CR>i
"nmap <C-b> :read ~/.vim/bf<CR>
"vmap <C-b> "w!~/.vim/bf<CR>

" Using the mouse on a terminal.
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

" make commpand shortcut
"nmap  :write:make 
"imap :write:make
nmap  :make run <C-u>
imap :make run <C-u> 

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundle$B$G4IM}$9$k%G%#%l%/%H%j$r;XDj(B
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle$B<+BN$r(Bneobundle$B$G4IM}(B
NeoBundleFetch 'Shougo/neobundle.vim'
 
" $B:#8e$3$N$"$?$j$KDI2C$N%W%i%0%$%s$r$I$s$I$s=q$$$F9T$-$^$9!*!*(B"
 
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" $BL$%$%s%9%H!<%k$N%W%i%0%$%s$,$"$k>l9g!"%$%s%9%H!<%k$9$k$+$I$&$+$r?R$M$F$/$l$k$h$&$K$9$k@_Dj(B
" $BKh2sJ9$+$l$k$H<YKb$J>l9g$b$"$k$N$G!"$3$N@_Dj$OG$0U$G$9!#(B
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

