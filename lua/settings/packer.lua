vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
use{'wbthomason/packer.nvim'}
use{'williamboman/mason.nvim', run = ':MasonUpdate'}
require("mason").setup()

use{'github/copilot.vim', run = ':CopilotUpdate'}

use{'mg979/vim-visual-multi', branch = 'master'}  

use{'nvim-telescope/telescope.nvim', tag = '0.1.2',
     requires = { {'nvim-lua/plenary.nvim'} }
}
use{'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
use{'nvim-treesitter/playground'}

use{'nvim-neo-tree/neo-tree.nvim',
      branch = 'v3.x',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
}}

use{'mfussenegger/nvim-dap',
     requires = { 'nvim-neotest/nvim-nio', 'rcarriga/nvim-dap-ui' }
}
-- , 'williamboman/codelldb.nvim'
use{"nvim-neotest/neotest", requires = {"alfaix/neotest-gtest"}}

use{
  'VonHeikemen/lsp-zero.nvim',
   branch = 'v2.x',
   requires = {
   -- LSP Support
   { 'neovim/nvim-lspconfig' },
   { 'williamboman/mason.nvim', run = function() pcall(vim.cmd, 'MasonUpdate') end },
   { 'williamboman/mason-lspconfig.nvim' },

   -- Autocompletion
   { 'hrsh7th/nvim-cmp' },       
   { 'hrsh7th/cmp-buffer' },     
   { 'hrsh7th/cmp-path' },       
   { 'hrsh7th/cmp-nvim-lsp' },   
   { 'hrsh7th/cmp-nvim-lua' },   
   { 'saadparwaiz1/cmp_luasnip' },

        -- Snippets
   { 'L3MON4D3/LuaSnip' },       
   { 'rafamadriz/friendly-snippets' },
 }
}
end)
