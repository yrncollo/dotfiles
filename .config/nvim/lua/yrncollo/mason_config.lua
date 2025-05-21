require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls'},  -- Add the LSP servers you want to install
  automatic_installation = true,
})

