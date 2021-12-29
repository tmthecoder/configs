" Source your .vimrc
source ~/.vimrc

" -- Suggested options --
" Show a few lines of context around the cursor. Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching.
set incsearch

" Don't use Ex mode, use Q for formatting.map Q gq
map Q gq

" -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
"" Map \r to the Reformat Code action
map <leader>r <Action>(ReformatCode)

" Map <leader>c to idea's Git Commit/VCS dialog
map <leader>c <Action>(CheckinProject)

" Map <leader>d to start debug
map <leader>d <Action>(Debug)

" Map <leader>f to idea's alt-enter error fix
map <leader>f <Action>(ShowIntentionActions)

" Map <leader>g to idea's command-enter auto generation
map<leader>g <Action>(Generate)

" Set the handler for conflicting shortcuts
sethandler n:vim i:ide

"" Map \b to toggle the breakpoint on the current line
"map \b <Action>(ToggleLineBreakpoint)


" Find more examples here: https://jb.gg/share-ideavimrc
