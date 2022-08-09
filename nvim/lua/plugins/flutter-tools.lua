local on_attach = require("../generic/lsp-on-attach")

require('flutter-tools').setup({
    lsp = {
        on_attach = on_attach
    }
})

