require('nvim-tree').setup()
require('lualine').setup {
    options = {
        theme = 'auto'
    }
}
require('material').setup({
    disable = {
        background = true
    },
    lualine_style = 'default'
})

require('nvim-tree').setup {
    open_on_tab = true,
    open_on_setup = true,
    auto_close = true,
    hijack_directories = {
        enable = true,
        auto_open = true
    }
}
local nvim_lsp = require("lspconfig")
local lsp_status = require("lsp-status")

local on_attach = function(client)
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
end

local servers = {
    "rust_analyzer",
    "clangd",
    "tsserver",
    "cmake",
    "bashls"
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = lsp_status.capabilities
    }
end

-- Setup diagnostics formaters and linters for non LSP provided files
nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    capabilities = lsp_status.capabilities,
    cmd = {"diagnostic-languageserver", "--stdio"},
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
                args = {"--format", "json", "-"},
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
                args = {"--stdin"},
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = "markdownlint",
                formatLines = 1,
                formatPattern = {
                    "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
                    {
                        line = 1,
                        column = 3,
                        message = {4}
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
                args = {"-i", "2", "-bn", "-ci", "-sr"}
            },
            prettier = {
                command = "prettier",
                args = {"--stdin-filepath", "%filepath"},
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

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        underline = true,
        virtual_text = false,
        signs = true,
        update_in_insert = true
    }
)

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)

local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})

require("trouble").setup()
require'lspconfig'.bashls.setup{}
require("flutter-tools").setup{} 
require'lspconfig'.vimls.setup{}
