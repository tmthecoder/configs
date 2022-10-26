local on_attach = require("../generic/lsp-on-attach")

require('typescript').setup({
    server = {
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        on_attach = on_attach
    }
})
