" get all configs from the shared init
source ~/.config/vim/init.vim

" disable vi support so we can use plugins
set nocompatible

" setup vundle
set rtp+=~/.vim/bundle/Vundle.vim

" setup vundle with nvim- & vim-compatible plugins
call plug#begin()
source ~/.config/nvim/plugins.vim
call plug#end()

" Loads lua config
lua require('init')

set completeopt=menuone,noinsert,noselect

filetype plugin indent on

let g:material_style = "darker"
colorscheme material 
