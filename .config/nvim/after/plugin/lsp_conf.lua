local lspconfig = require('lspconfig')
local keybindings = require('yrncollo.lsp_keybindings')  -- Import the keybindings

local on_attach = keybindings.on_attach  -- Use the on_attach function from keybindings.lua

local cmp = require('cmp')
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
      on_attach = keybindings.on_attach,
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
    ['rust_analyzer'] = function()
    lspconfig.rust_analyzer.setup({
      on_attach = keybindings.on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          cargo = {
            loadOutDirsFromCheck = true
          },
          procMacro = {
            enable = true
          }
        }
      }
    })
  end,
  ['html'] = function()
	  lspconfig.html.setup({
		  on_attach = on_attach,
		  capabilities = capabilities,
	  })
  end,

  ['tsserver'] = function()
lspconfig.tsserver.setup {
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = '/usr/bin/vue-language-server',
        languages = { 'vue' },
      },
    },
  },
}
  end,
  ['volar'] = function()
lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}
  end,
  ['pyright'] = function()
	  lspconfig.pyright.setup({
		  on_attach = on_attach,
		  capabilities = capabilities,
		  filetypes ={"python"}
	  })
  end
})

