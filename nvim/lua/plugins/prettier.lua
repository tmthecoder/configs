local prettier = require("prettier")

prettier.setup({
    bin = 'prettier', -- or `'prettierd'` (v0.22+)
    filetypes = {
        "css",
        "graphql",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "less",
        "markdown",
        "scss",
        "typescript",
        "typescriptreact",
        "yaml",
    },
    ["null-ls"] = {
        condition = function()
          return prettier.config_exists({
            check_package_json = true,
          })
        end,
    }
})
