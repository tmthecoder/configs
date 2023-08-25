local opts = {
    ensure_installed = {
        'asm_lsp',
        'arduino_language_server',
        'bashls',
        'clangd',
        'cmake',
        'dockerls',
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
