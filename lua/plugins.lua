return {
-- --------------- Basic Plugins ---------------
  {'nvim-tree/nvim-web-devicons'},

-- --------------- User Interface ---------------
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
    event = "VimEnter",
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
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "user.lualine"
    end,
    event = "VimEnter",
  },
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    }
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require "user.nvimtree"
    end,
    cmd = {"NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle"},
    event = "User DirOpened",
  },

-- --------------- Language Server Protocol ---------------
  {
    'williamboman/mason.nvim',
    lazy = true,
    cmd = {"Mason", "MasonInstall", "MasonUninstall", "MasonLog"},
    config = function()
      require "user.lsp.mason"
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = true,
    cmd = {"LspInstall", "LspUninstall"},
    dependencies = {
      'neovim/nvim-lspconfig'
    },
    config = function()
      require "user.lsp.lspconfig"
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'williamboman/mason.nvim',
    },
  },

-- --------------- Completition ---------------
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require "user.lsp.cmp"
    end,
    event = {"InsertEnter", "CmdlineEnter"},
     dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    },
 },

  {'hrsh7th/cmp-nvim-lsp', lazy = true},
  {'hrsh7th/cmp-buffer', lazy = true},
  {'hrsh7th/cmp-path', lazy = true},
  {
    'hrsh7th/cmp-cmdline',
    lazy = true,
    event = "CmdlineEnter",
  },

-- --------------- Snippets ---------------
  {
    "L3MON4D3/LuaSnip",
    tag = "v1.2.1",
    build = "make install_jsregexp",
  },

-- --------------- Git ---------------
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "user.gitsigns"
    end,
    event = {"BufReadPre", "BufNewFile"},
    cmd = "Gitsigns",
  },
-- --------------- Help ---------------
  {
    'folke/which-key.nvim',
    cmd = "WhichKey",
    event = "VeryLazy",
    key = "<leader>",
    config = function()
      require "user.whichkey"
    end,
  },

-- --------------- Syntax ---------------
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
    event = {"BufReadPre", "BufNewFile"},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require "user.autopairs"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPre", "BufNewFile"},
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
