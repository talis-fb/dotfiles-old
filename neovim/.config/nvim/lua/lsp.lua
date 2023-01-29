-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()


local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Shortcuts of LSP
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>',
    --     { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>',
        { noremap = true, silent = true })

    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gr', '<cmd>Trouble lsp_references<CR>',
        { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
        { noremap = true, silent = true })
end



-- Configuração dos LSP
local lspconfig = require('lspconfig')
local servers = {
    { 'tsserver' },
    { 'denols' },
    { 'sumneko_lua' },
    { 'rust_analyzer' },
    { 'html' },
    { 'jsonls' },
    -- { 'eslint' },
    { 'cssls' },
    { 'clangd' },
    { 'pyright',
        {
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = false,
                        extraPaths = { '../' },
                    },
                    autoComplete = {
                        extraPaths = '../',
                    }
                }
            }
        }
    },
}

for _, server in ipairs(servers) do
    local lsp = server[1]
    local additional_settings = server[2]
    local setup = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    if additional_settings then
        for key, value in pairs(additional_settings) do
            setup[key] = value
        end
    end

    lspconfig[lsp].setup(setup)
end


return {
    on_attach = on_attach,
    capabilities = capabilities
}
