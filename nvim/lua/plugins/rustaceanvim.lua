local on_attach = require("../generic/lsp-on-attach")

vim.g.rustaceanvim = {
    -- LSP configuration
    server = {
        on_attach = on_attach,
    },
}
