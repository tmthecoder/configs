local opts = {
    ensure_installed = {
        'asm_lsp',
        'bashls',
        'clangd',
        'cmake',
        'eslint',
        'gopls',
        'jsonls',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'tsserver',
        'vimls'
    }
}

require('mason').setup()
require('mason-lspconfig').setup(opts)
