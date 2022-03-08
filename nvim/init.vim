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

filetype plugin indent on

colorscheme material 

