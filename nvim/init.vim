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
lua require('init')
command! TreeToggle lua require('tree').toggle()
lua require('bindings')

set completeopt=menuone,noinsert,noselect

"Nvim Tree Bindings
nnoremap <leader>t <cmd>TreeToggle<cr>

" Vista toggle shorthand
nnoremap <leader>v <cmd>Vista<cr>

filetype plugin indent on

colorscheme material 

autocmd VimEnter * TreeToggle
autocmd VimEnter * Vista
autocmd VimEnter * Trouble
