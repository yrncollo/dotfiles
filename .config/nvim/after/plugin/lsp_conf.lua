local lspconfig = require('lspconfig')
local keybindings = require('yrncollo.lsp_keybindings')  -- Import the keybindings

local on_attach = keybindings.on_attach  -- Use the on_attach function from keybindings.lua

local capabilities = vim.lsp.protocol.make_client_capabilities()

require('mason-lspconfig').setup_handlers({
  function(server_name) -- Default handler (optional)
    lspconfig[server_name].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,

  ['lua_ls'] = function()
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })
  end,
  -- Add more specific handlers for other servers if needed.
})

