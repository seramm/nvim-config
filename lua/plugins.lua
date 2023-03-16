return {
-- Basic Plugins
  {'nvim-tree/nvim-web-devicons'},

-- User Interface
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require "user.theme"
    end,
  },
  {
    'goolord/alpha-nvim',
    config = function()
      require "user.alpha"
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = "Telescope",
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
  },

-- Language Server Protocol
  {
    'williamboman/mason.nvim',
    lazy = true,
    config = function()
      require "user.lsp.mason"
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim'
    },
    config = function()
      require "user.lsp.lspconfig"
    end,
  },

-- Completition
  {
    'hrsh7th/nvim-cmp',
    dependecies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
    config = function()
      require "user.lsp.cmp"
    end,
  },

  {'hrsh7th/cmp-nvim-lsp', lazy = true},
  {'hrsh7th/cmp-buffer', lazy = true},
  {'hrsh7th/cmp-path', lazy = true},
  {'hrsh7th/cmp-cmdline', lazy = true},

-- Snippets
  {
    "L3MON4D3/LuaSnip",
    tag = "v1.2.1",
    build = "make install_jsregexp",
  },

-- Help
  {
    'folke/which-key.nvim',
    cmd = "WhichKey",
    config = function()
      require "user.whichkey"
    end,
  },

--Syntax
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSInstallInfo",
      "TSInstallSync",
      "TSInstallFromGrammar",
    },
    config = function()
      require "user.treesitter"
    end,
  },
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require "user.autopairs"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FileOpened",
    config = function()
      require "user.blankline"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    config = function()
      require "user.colorizer"
    end,
  },
}
