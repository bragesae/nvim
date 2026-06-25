vim.pack.add({
  -- Dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },

  -- LSP
  { src = "https://github.com/williamboman/mason.nvim" },
  { src = "https://github.com/williamboman/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },

  -- Completion
  { src = "https://github.com/hrsh7th/nvim-cmp" },
  { src = "https://github.com/hrsh7th/cmp-buffer" },
  { src = "https://github.com/hrsh7th/cmp-path" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
  { src = "https://github.com/hrsh7th/cmp-nvim-lua" },
  { src = "https://github.com/saadparwaiz1/cmp_luasnip" },

  -- Snippets
  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },

  -- Telescope
  { src = "https://github.com/nvim-telescope/telescope.nvim" },

  -- Treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/playground" },

  -- File explorer
  { src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },

  -- Search/replace
  { src = "https://github.com/nvim-pack/nvim-spectre" },

  -- Debugging
  { src = "https://github.com/mfussenegger/nvim-dap" },
  { src = "https://github.com/nvim-neotest/nvim-nio" },
  { src = "https://github.com/rcarriga/nvim-dap-ui" },
  { src = "https://github.com/theHamsta/nvim-dap-virtual-text" },

  -- Testing
  { src = "https://github.com/nvim-neotest/neotest" },
  { src = "https://github.com/alfaix/neotest-gtest" },

  -- AI
  { src = "https://github.com/github/copilot.vim" },

  -- Editing
  { src = "https://github.com/mg979/vim-visual-multi" },

  -- Misc
  { src = "https://github.com/Sang-it/fluoride" },
})

require("mason").setup()

-- Optional but recommended
pcall(require, "nvim-dap-virtual-text")
