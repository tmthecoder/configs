local M = {}

M.diagnostic_search = function()
  local start_line, end_line
  local mode = string.lower(vim.fn.mode())
  if mode == "v" then
    start_line = vim.fn.line("v")
    end_line = vim.fn.line(".")
    if start_line > end_line then
      start_line, end_line = end_line, start_line
    end
  else
    start_line = vim.fn.line(".")
    end_line = start_line
  end

  local bufnr = vim.api.nvim_get_current_buf()
  local all_diagnostics = vim.diagnostic.get(bufnr)
  local diagnostics = {}
  for _, diagnostic in ipairs(all_diagnostics) do
    if diagnostic.lnum + 1 >= start_line and diagnostic.lnum < end_line then
      table.insert(diagnostics, diagnostic)
    end
  end

  if #diagnostics == 0 then
    vim.notify("No diagnostics", vim.log.levels.WARN)
    return
  end

  local index = 1
  if #diagnostics > 1 then
    local inputList = { "Which diagnostic do you want explained?:" }
    for i, diagnostic in ipairs(diagnostics) do
      table.insert(inputList, string.format("%d. %s", i, diagnostic.message))
    end
    index = vim.fn.inputlist(inputList)
    if index <= 0 or index > #diagnostics then
      vim.notify("No diagnostic selected", vim.log.levels.INFO)
      return
    end
  end

  local clean_message = diagnostics[index].message:gsub("[A-Za-z0-9:/\\._%-]+[.][A-Za-z0-9]+", "")
  clean_message = clean_message:gsub("[A-Za-z0-9:/\\._%-]+[/\\][A-Za-z0-9:/\\._%-]+[.][A-Za-z0-9]+", "")

  local msg =
      "You are an expert coder and helpful assistant who can help debug code diagnostics, such as warning and error messages."
      ..
      "When appropriate, give solutions with code snippets as fenced codeblocks with a language identifier to enable syntax highlighting.\n"
      .. "This is a the diagnostic message for the code:\n"
      .. clean_message

  require("sg.cody.commands").ask_range(bufnr, start_line - 1, end_line, msg)
end

return M
