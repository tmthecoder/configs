local lsp_status = require("lsp-status")

local on_attach = function(client, buffnr)
    lsp_status.register_progress()
    lsp_status.config(
        {
            status_symbol = "LSP ",
            indicator_errors = "E",
            indicator_warnings = "W",
            indicator_info = "I",
            indicator_hint = "H",
            indicator_ok = "ok"
        }
    )
    -- Keybinds
    local bufopts = { noremap = true, silent = true, buffer = buffnr }
    vim.keymap.set('n', '<leader>dc', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<leader>df', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<leader>tdf', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.hover, bufopts)

    -- Formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = buffnr,
            callback = function() vim.lsp.buf.format() end

        })
    end
    -- code lens
    if client.resolved_capabilities.code_lens then
        local codelens = vim.api.nvim_create_augroup(
            'LSPCodeLens',
            { clear = true }
        )
        vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave', 'CursorHold' }, {
            group = codelens,
            callback = function()
                vim.lsp.codelens.refresh()
            end,
            buffer = bufnr,
        })
    end
end

return on_attach
