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

"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
 

" 以下は必要に応じて追加
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
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
"syntax proc
NeoBundle 'vim-scripts/proc.vim'

"Snippets
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell' 
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/vimshell-ssh'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/eregex.vim'
NeoBundle 'cakebaker/scss-syntax.vim'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'git://gist.github.com/411828.git', {'directory': 'endtagcomment'}

NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle "ctrlpvim/ctrlp.vim"
call neobundle#end()
 
" Required:
filetype plugin indent on
 
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------

let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
set tags+=.git/tags
