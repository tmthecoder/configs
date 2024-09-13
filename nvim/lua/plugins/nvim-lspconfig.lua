local nvim_lsp = require("lspconfig")

local on_attach = require("../generic/lsp-on-attach")

local servers = {
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
    'ocamllsp',
    'pyright',
    'rust_analyzer',
    'tsserver',
    'vimls',
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local diagnisticls_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "diagnostic-languageserver", "--stdio" },
    filetypes = {
        "lua",
        "sh",
        "markdown",
        "json",
        "yaml",
        "toml"
    },
    init_options = {
        linters = {
            shellcheck = {
                command = "shellcheck",
                debounce = 100,
                args = { "--format", "json", "-" },
                sourceName = "shellcheck",
                parseJson = {
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${code}]",
                    security = "level"
                },
                securities = {
                    error = "error",
                    warning = "warning",
                    info = "info",
                    style = "hint"
                }
            },
            markdownlint = {
                command = "markdownlint",
                isStderr = true,
                debounce = 100,
                args = { "--stdin" },
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = "markdownlint",
                formatLines = 1,
                formatPattern = {
                    "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
                    {
                        line = 1,
                        column = 3,
                        message = { 4 }
                    }
                }
            }
        },
        filetypes = {
            sh = "shellcheck",
            markdown = "markdownlint"
        },
        formatters = {
            shfmt = {
                command = "shfmt",
                args = { "-i", "2", "-bn", "-ci", "-sr" }
            },
            prettier = {
                command = "prettier",
                args = { "--stdin-filepath", "%filepath" },
            }
        },
        formatFiletypes = {
            sh = "shfmt",
            json = "prettier",
            yaml = "prettier",
            toml = "prettier",
            markdown = "prettier",
            lua = "prettier"
        }
    }
}

for _, lsp in ipairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    };
    if (lsp == "arduino_language_server") then
        opts["cmd"] = {
            "arduino-language-server",
            "-cli-config", "/Users/tejasmehta/Library/Arduino15/arduino-cli.yaml",
            "-fqbn", "arduino:avr:uno",
            "-cli", "/opt/homebrew/bin/arduino-cli",
            "-clangd", "/usr/bin/clangd"
        }
    end
    nvim_lsp[lsp].setup(opts)
end

-- Setup diagnostics formaters and linters for non LSP provided files
nvim_lsp.diagnosticls.setup(diagnisticls_opts)
