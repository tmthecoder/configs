" get all configs from the shared init
source ~/.config/vim/init.vim

" disable vi support so we can use plugins
set nocompatible

" setup vundle
set rtp+=~/.vim/bundle/Vundle.vim

" setup vundle with nvim- & vim-compatible plugins
call vundle#begin()
source ~/.config/nvim/plugins.vim
call vundle#end()
filetype plugin indent on
