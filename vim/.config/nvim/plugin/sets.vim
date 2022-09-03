set nocompatible

set path+=**
set wildignore+=*/node_modules/*
set wildmode=longest,full
set clipboard+=unnamedplus

set mouse=a

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab

filetype plugin on
filetype indent on
syntax on
set autoindent
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
set laststatus=3
set cursorline
set termguicolors
set colorcolumn=120

set undofile

set t_ti= t_te=

set pumheight=12

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
