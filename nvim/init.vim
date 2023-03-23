" get all configs from the shared init
source ~/.config/vim/init.vim

" Set color support
set termguicolors

"Persistent undos
set undodir=~/.vim/undo-dir
set undofile

" setup Vim-Plug with nvim- & vim-compatible plugins
call plug#begin()
source ~/.config/nvim/plugins.vim
call plug#end()

" Material theme setting
let g:material_style = "darker"

" Loads lua config
lua require('plugins')
lua require('bindings')

set completeopt=menuone,noinsert,noselect
set mouse=

set regexpengine=0
syntax on
filetype plugin indent on

colorscheme material 

autocmd VimEnter * NvimTreeToggle
autocmd VimEnter * Vista
autocmd VimEnter * Trouble
