local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Telescope Shortcuts (finding stuff)
map('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', opts)

-- Nvim Tree Bindings
map('n', '<leader>tr', '<Cmd>NvimTreeRefresh<CR>', opts)

-- Buffer Bindings (Next & Previous)
map('n', '<C-+>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-->', '<Cmd>BufferPrevious<cr>', opts)

-- Buffer Bindings (Positional)
map('n', '<C-`>', '<Cmd>BufferFirst<CR>', opts)
map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
