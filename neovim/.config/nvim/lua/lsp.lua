-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)



-- # Pacotes necessários para serem instalados pelo npm
-- @volar/vue-language-server
-- typescript-language-server
-- typescript
-- vscode-langservers-extracted

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

-- Configuração dos LSP
local lspconfig = require('lspconfig')
-- local servers = { 'pyright', 'tsserver', 'vuels', 'html', 'jsonls', 'eslint', 'cssls', 'clangd' }
local servers = { 'pyright', 'tsserver', 'html', 'jsonls', 'eslint', 'cssls', 'clangd', 'sumneko_lua', 'rust_analyzer', 'denols' }
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Shortcuts of LSP
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap=true, silent=true })
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig['volar'].setup {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}




-- luasnip setup
local luasnip = require 'luasnip'




-- Formatter
local  null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  on_attach = on_attach,

  sources = {
    formatting.autopep8,
    formatting.prettier,
    formatting.jq,
    diagnostics.flake8,
    code_actions.gitsigns,
  }
})
--




-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}



