source ~/.config/vim/plugins.vim
" Tree-sitter & LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-lua/lsp-status.nvim'

" nvim lsp completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/nvim-cmp'
Plug 'folke/trouble.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Snippet engine
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind.nvim'
Plug 'rafamadriz/friendly-snippets'

" Nvim Tree & Icons
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Tab Line
Plug 'romgrk/barbar.nvim'

" Telescope for finding stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'marko-cerovac/material.nvim'
Plug 'mbbill/undotree'

" Language-specific
Plug 'mfussenegger/nvim-jdtls'
Plug 'simrat39/rust-tools.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'jose-elias-alvarez/typescript.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Surround for Auto-complete
Plug 'kylechui/nvim-surround'
Plug 'windwp/nvim-ts-autotag'
Plug 'windwp/nvim-autopairs'
