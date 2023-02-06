call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" shared
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" themes
Plug 'navarasu/onedark.nvim'
Plug 'shaunsingh/nord.nvim'

" must-have plugins ------------------------------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" lsp stuff
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'mfussenegger/nvim-jdtls'

" autocomplete
Plug 'folke/neodev.nvim' " autocomplete for vim's lua api

Plug 'hrsh7th/nvim-cmp' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'

" signature help
Plug 'Issafalcon/lsp-overloads.nvim'

" telescope stuff
Plug 'nvim-telescope/telescope.nvim' , { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-ui-select.nvim'

" file tree
Plug 'kyazdani42/nvim-tree.lua'

" editing ----------------------------------------------
" commenting
Plug 'numToStr/Comment.nvim'

" auto brackets/quotes
Plug 'windwp/nvim-autopairs'

" better indenting
Plug 'Vimjas/vim-python-pep8-indent'
" Plug 'yioneko/nvim-yati'

" latex
Plug 'lervag/vimtex'

" extras -----------------------------------------------
" terminal
Plug 'akinsho/toggleterm.nvim', {'tag' : '2.3.0'}

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" status line
Plug 'nvim-lualine/lualine.nvim'

" vim sneak
" Plug 'justinmk/vim-sneak'

" harpoon
Plug 'ThePrimeagen/harpoon'

" copilot
Plug 'github/copilot.vim'

" tagbar
Plug 'preservim/tagbar'

" lsp progress
Plug 'j-hui/fidget.nvim'

call plug#end()

" plugin setup
lua require('init')

" highlights
hi NormalFloat guibg=None
hi FloatBorder guibg=None guifg=#abb2bf
hi Search guibg=#3b3f4c guifg=None
" hi LspSignatureActiveParameter guibg=None guifg=#61afef gui=bold
hi LspSignatureActiveParameter guibg=#3b3f4c guifg=None

" lua << EOF
" local setup = function(name)
"     return function()
"         require("configs." .. name)
"     end
" end
" EOF

