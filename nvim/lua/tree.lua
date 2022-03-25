local tree = {}
vim.g.nvim_tree_width = 30
tree.toggle = function()
  require'nvim-tree'.toggle()
  if require'nvim-tree.view'.is_visible() then
    require'bufferline.state'.set_offset(vim.g.nvim_tree_width + 1, 'File Tree')
  else
    require'bufferline.state'.set_offset(0)
  end
end

return tree
