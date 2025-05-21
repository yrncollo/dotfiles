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


--  ['tsserver'] = function()
--lspconfig.tsserver.setup {
--  init_options = {
--    plugins = {
--      {
--        name = '@vue/typescript-plugin',
--        location = '/usr/bin/vue-language-server',
--        languages = { 'vue' },
--      },
--    },
--  },
--}
--  end,
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    local jdtls = require("jdtls")
    local home = os.getenv("HOME")
    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
    local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

    local config = {
      cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.level=ALL",
        "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        "-Xms1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
        "-data", workspace_dir,
      },
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
      on_attach = on_attach,
      capabilities = capabilities,
    }

    jdtls.start_or_attach(config)
  end,
})

