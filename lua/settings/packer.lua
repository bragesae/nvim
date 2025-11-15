-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    'github/copilot.vim',
      run = ':CopilotUpdate'
  }


  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
  }}
  use('mbbill/undotree')
  use {
      'nvim-tree/nvim-tree.lua',
        requires = {
                'nvim-tree/nvim-web-devicons', -- optional
                  },
  }
  use {
	  "williamboman/mason.nvim",
	  run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }
  use {"catppuccin/nvim", as = "catppuccin"}
use {
  'mg979/vim-visual-multi',
  branch = 'master',
}  
    use {
      "VonHeikemen/lsp-zero.nvim",
      branch = "v2.x",
      requires = {
        -- LSP Support
        { "neovim/nvim-lspconfig" }, -- Required
        { "williamboman/mason.nvim", run = function() pcall(vim.cmd, "MasonUpdate") end }, -- Optional
        { "williamboman/mason-lspconfig.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },       
        { "hrsh7th/cmp-buffer" },     
        { "hrsh7th/cmp-path" },       
        { "hrsh7th/cmp-nvim-lsp" },   
        { "hrsh7th/cmp-nvim-lua" },   
        { "saadparwaiz1/cmp_luasnip" },

        -- Snippets
        { "L3MON4D3/LuaSnip" },       
        { "rafamadriz/friendly-snippets" },
      }
    }


end)

