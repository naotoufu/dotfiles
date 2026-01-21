"========= 基本設定 =========
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set termencoding=utf-8

set nocompatible
syntax on
filetype plugin indent on

" 画面表示
set number
set norelativenumber
set ruler
set cursorline
set showcmd
set wildmenu
set laststatus=2        " ステータスライン常に表示

" インデント
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

" 検索
set ignorecase
set smartcase
set incsearch
set hlsearch

" 視認性
set showmatch           " 対応する括弧をハイライト
set matchtime=2
set scrolloff=5         " 上下に余白
set sidescrolloff=5

" クリップボード（macOSなら基本OK）
" set clipboard=unnamedplus

" バックアップ類
set noswapfile
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undo

" カラースキーム（お好みで）
if has('termguicolors')
  set termguicolors
endif
" colorscheme desert " 好きなテーマがあればここを有効化

"========= キーマッピング =========
let mapleader="\<Space>"

" 保存 / 終了
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" 行移動（wrap 対応）
nnoremap j gj
nnoremap k gk

" スプリット移動を Ctrl + h/j/k/l に
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" タブ操作
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tp :tabprevious<CR>
nnoremap <Leader>tnx :tabnext<CR>

" バッファ切り替え
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>

"========= Swift / iOS 開発向け調整 =========

" Swift は 4 スペース
augroup swift_settings
  autocmd!
  autocmd FileType swift setlocal tabstop=4 shiftwidth=4 expandtab
augroup END

" JSON, YAML は 2 スペース
augroup misc_indent
  autocmd!
  autocmd FileType json,yaml,yml setlocal tabstop=2 shiftwidth=2 expandtab
augroup END

