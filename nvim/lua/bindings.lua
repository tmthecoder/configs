local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope Shortcuts (finding stuff)
local telescope = require('telescope.builtin')
map('n', '<leader>ff', telescope.find_files, opts)
map('n', '<leader>gr', telescope.live_grep, opts)
map('n', '<leader>gf', telescope.git_files, opts)

-- Nvim Tree Bindings
map('n', '<leader>tt', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', opts)

-- Buffer Bindings (Next & Previous)
map('n', '<A-=>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-->', '<Cmd>BufferPrevious<cr>', opts)

-- Buffer Bindings (Positional)
map('n', '<A-`>', '<Cmd>BufferFirst<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Buffer Bindings (Close)
map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)

-- Undo Tree Bindings
map('n', '<leader>ut', vim.cmd.UndotreeToggle)

-- Vim Fugitive
map('n', '<leader>gs', vim.cmd.Git)
