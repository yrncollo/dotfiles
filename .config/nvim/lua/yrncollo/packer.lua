-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'folke/tokyonight.nvim',
	  as = 'tokyo-night',
	  config = function()
		  vim.cmd('colorscheme tokyonight-night')
	  end

  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('mbbill/undotree')
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("christoomey/vim-tmux-navigator")


  -- code completion
  use("hrsh7th/nvim-cmp" )
  use("hrsh7th/cmp-nvim-lsp" )
  use("hrsh7th/cmp-buffer" )-- source for text in buffer
  use("hrsh7th/cmp-path" ) -- source for file system paths
  use("L3MON4D3/LuaSnip" ) -- for autocompletion
  use("saadparwaiz1/cmp_luasnip" ) -- useful snippets
  use("rafamadriz/friendly-snippets" ) -- vs-code like pictograms
  use("onsails/lspkind.nvim" ) -- vs-code like pictograms

  -- copilot
  use ("github/copilot.vim")
  use ("wakatime/vim-wakatime")

  -- Markdown preview
-- install without yarn or npm
use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})

use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

end)
