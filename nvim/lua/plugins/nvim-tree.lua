local nvim_tree = require('nvim-tree')
local opts = {
  open_on_tab = true,
  hijack_directories = {
    enable = true,
    auto_open = true
  },
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
  modified = {
    enable = true,
  }
}
nvim_tree.setup(opts)

local nvim_tree_api = require('nvim-tree.api')
local bufferline_api = require('bufferline.api')

local function open_nvim_tree()
  require("nvim-tree.api").tree.toggle({ focus = false })
end

nvim_tree_api.events.subscribe(nvim_tree_api.events.Event.TreeOpen, function()
  bufferline_api.set_offset(31, "File Tree")
end)


nvim_tree_api.events.subscribe(nvim_tree_api.events.Event.TreeClose, function()
  bufferline_api.set_offset(0)
end)

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
