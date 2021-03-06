local nvim_tree = require('nvim-tree')
nvim_tree.setup {
    open_on_tab = true,
    open_on_setup = true,
    hijack_directories = {
        enable = true,
        auto_open = true
    }
}

local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

vim.api.nvim_create_user_command('NvimTreeToggle', function()
    nvim_tree.toggle()
  end,
  {}
)
