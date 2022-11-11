" get all configs from the shared init
source ~/.config/vim/init.vim

" Set color support
set termguicolors

" setup Vim-Plug with nvim- & vim-compatible plugins
call plug#begin()
source ~/.config/nvim/plugins.vim
call plug#end()

" Material theme setting
let g:material_style = "darker"

" Loads lua config
lua require('plugins/flutter-tools')
lua require('plugins/lualine')
lua require('plugins/luasnip')
lua require('plugins/material')
lua require('plugins/nvim-tree')
lua require('plugins/nvim-cmp')
lua require('plugins/nvim-autopairs')
lua require('plugins/nvim-lspconfig')
lua require('plugins/nvim-lspstatus')
lua require('plugins/nvim-surround')
lua require('plugins/nvim-ts-autotag')
lua require('plugins/rust-tools')
lua require('plugins/typescript')
lua require('trouble').setup();
lua require('bindings')

set completeopt=menuone,noinsert,noselect
set mouse=

filetype plugin indent on

colorscheme material 

autocmd VimEnter * NvimTreeToggle
autocmd VimEnter * Vista
autocmd VimEnter * Trouble
