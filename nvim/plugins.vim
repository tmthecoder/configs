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
Plug 'petertriho/cmp-git'
Plug 'saecki/crates.nvim', { 'tag': 'stable' }
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

" Commenting
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'numToStr/Comment.nvim'

" Copilot
Plug 'github/copilot.vim'

" Cody
Plug 'sourcegraph/sg.nvim', { 'do': 'nvim -l build/init.lua' }

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ellisonleao/glow.nvim'

Plug 'luckasRanarison/nvim-devdocs'

" Executor
Plug 'google/executor.nvim'
Plug 'MunifTanjim/nui.nvim'

" Error Lookup - wtf
Plug 'MunifTanjim/nui.nvim'
Plug 'piersolenski/wtf.nvim'

Plug 'kawre/leetcode.nvim'
