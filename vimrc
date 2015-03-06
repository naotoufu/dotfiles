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
"nmap <silent> <Tab> 15<Right>
"vmap <silent> <Tab> <C-o>15<Right>
"nmap <silent> <S-Tab> 15<Left>
"vmap <silent> <S-Tab> <C-o>15<Left>
"nmap <silent> <C-n> 	  :update<CR>:bn<CR>
"imap <silent> <C-n> <ESC> :update<CR>:bn<CR>
"vmap <silent> <C-n> <ESC> :update<CR>:bn<CR>
"cmap <silent> <C-n> <ESC> :update<CR>:bn<CR> 

"$B%S!<%W2;$9$Y$F$rL58z$K$9$k(B
set visualbell t_vb=
set noerrorbells "$B%(%i!<%a%C%;!<%8$NI=<(;~$K%S!<%W$rLD$i$5$J$$(B


" make commpand shortcut
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

<<<<<<< HEAD
" make commpand shortcut
"nmap  :write:make 
"imap :write:make
nmap  :make run <C-u>
imap :make run <C-u> 

=======
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
>>>>>>> 97a693464cde8b762fe078f9b6dcb5b42b9e677b

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundle$B$G4IM}$9$k%G%#%l%/%H%j$r;XDj(B
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle$B<+BN$r(Bneobundle$B$G4IM}(B
NeoBundleFetch 'Shougo/neobundle.vim'
 

" $B0J2<$OI,MW$K1~$8$FDI2C(B
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
"syntax Oracle proc
NeoBundle 'vim-scripts/proc.vim'

"Snippets
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/vimshell' 
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/eregex.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle "ctrlpvim/ctrlp.vim"
NeoBundle 'soramugi/auto-ctags.vim'
call neobundle#end()
 
" Required:
filetype plugin indent on
 
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

<<<<<<< HEAD
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
set tags+=.git/tags

inoremap ;; <C-O>$;<CR>

helptags ~/.vim/bundle/vimdoc-ja/doc

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
=======
>>>>>>> 97a693464cde8b762fe078f9b6dcb5b42b9e677b
