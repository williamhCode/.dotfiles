set nocompatible

" set clipboard+=unnamedplus

set mouse=a

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

filetype plugin on
filetype indent on
syntax on
set exrc
set relativenumber
set number
set hidden
set noerrorbells
set nowrap
set incsearch
set scrolloff=8
set sidescrolloff=10
set signcolumn=yes
set wildmenu
set splitbelow splitright
" gloabl statusline
set laststatus=3 
set cursorline
set termguicolors
set ignorecase
set smartcase
set nohlsearch
set noshowmode

set undofile
set pumheight=12

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" autocmd BufRead,BufNewFile *.pxd,*.pxi,*.pyx set filetype=cython
