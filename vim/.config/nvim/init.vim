call plug#begin('~/.vim/plugged')

" themes
Plug 'navarasu/onedark.nvim'

" syntax
" Plug 'anntzer/vim-cython'

" treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" commenting
Plug 'tpope/vim-commentary'

" lsp stuff
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'

" telescope stuff
Plug 'nvim-telescope/telescope.nvim' , { 'branch': '0.1.x' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-frecency.nvim'
" Plug 'kkharji/sqlite.lua'

" icons for plugins
Plug 'kyazdani42/nvim-web-devicons'

" auto brackets/quotes
Plug 'windwp/nvim-autopairs'

" better indenting
Plug 'Vimjas/vim-python-pep8-indent'

" file tree
Plug 'kyazdani42/nvim-tree.lua'

" status line
Plug 'nvim-lualine/lualine.nvim'

" lsp/autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" tmux nav
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" plugin setup
lua require('init')

" highlights
hi NormalFloat guibg=None
hi FloatBorder guibg=None guifg=#abb2bf

" hi NonText guibg=None
" hi Normal guibg=None
" hi LineNr guibg=None
" hi Folded guibg=None
" hi NonText guibg=None
" hi SpecialKey guibg=None
" hi SignColumn guibg=None
" hi EndOfBuffer guibg=None

" hi NvimTreeNormal guibg=None
" hi NvimTreeEndOfBuffer guibg=None
" hi NvimTreeWinSeparator guifg=#3c3f4b


" tmux nav settings
let g:tmux_navigator_save_on_switch = 2
