local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    on_attach = require('lsp').on_attach,
    sources = {
        -- ## With Mason this code is not necessary
        -- -- Diagnostics
        -- diagnostics.flake8,
        -- diagnostics.commitlint,
        -- diagnostics.eslint,
        --
        -- -- Format
        -- formatting.autopep8,
        -- formatting.prettier,
        -- formatting.jq,
        --
        -- -- Code Actions
        -- code_actions.gitsigns,
    }
})
