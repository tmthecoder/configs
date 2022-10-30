local ls = require('luasnip')
ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI"
})

ls.snippets = {
    all = {},
    html = {}
}

ls.snippets.javascript = ls.snippets.html
ls.snippets.javascriptreact = ls.snippets.html
ls.snippets.typescriptreact = ls.snippets.html

ls.add_snippets("all")

require("luasnip/loaders/from_vscode").load()
require("luasnip/loaders/from_vscode").load({ paths = { "~/.local/share/nvim/plugged/friendly-snippets" } })
