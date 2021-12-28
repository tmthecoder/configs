" get all configs from the shared vim init
source ~/.config/vim/init.vim

" disable vi support so we can use plugins
set nocompatible

" setup vundle
set rtp+=~/.vim/bundle/Vundle.vim

" setup vundle with vim-only plugins
call vundle#begin()
source ~/.config/vim/plugins.vim
call vundle#end()
filetype plugin indent on
