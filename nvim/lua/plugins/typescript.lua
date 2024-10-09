local on_attach = require("../generic/lsp-on-attach")

require('typescript-tools').setup({
    server = {
        on_attach = on_attach
    }
})
