" get all configs from the shared init
source ~/.config/vim/init.vim

" disable vi support so we can use plugins
set nocompatible
set termguicolors

" setup vundle
set rtp+=~/.vim/bundle/Vundle.vim

" setup vundle with nvim- & vim-compatible plugins
call plug#begin()
source ~/.config/nvim/plugins.vim
call plug#end()

let g:material_style = "darker"

" Loads lua config
lua require('init')

set completeopt=menuone,noinsert,noselect

" Bindings for telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" LSP Bindings
nnoremap <leader>d <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>ca <cmd> lua vim.lsp.buf.code_action()<cr>

"Nvim Tree Bindings
nnoremap <leader>t <cmd>NvimTreeToggle<cr>
nnoremap <leader>tr <cmd>NvimTreeRefresh<cr>

filetype plugin indent on

colorscheme material 

