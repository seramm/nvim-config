return {
  -- --------------- Basic Plugins ---------------
  { "nvim-tree/nvim-web-devicons" },

  -- --------------- User Interface ---------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("ui.theme")
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("ui.alpha")
    end,
    event = "VimEnter",
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    tag = "0.1.1",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("ui.lualine")
    end,
    event = "VimEnter",
  },
  {
    "akinsho/bufferline.nvim",
    branch = "main",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("ui.bufferline")
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("ui.nvimtree")
    end,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
  },

  -- --------------- Language Server Protocol ---------------
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog" },
    config = function()
      require("lsp.mason")
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    cmd = { "LspInstall", "LspUninstall" },
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp.lspconfig")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    cmd = { "NullLsInfo" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("lsp.null-ls")
    end,
  },

  -- --------------- Completition ---------------
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("lsp.cmp")
    end,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
  },

  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  {
    "hrsh7th/cmp-cmdline",
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
      require("util.gitsigns")
    end,
    event = { "BufReadPre", "BufNewFile" },
    cmd = "Gitsigns",
  },
  -- --------------- Util ---------------
  {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    key = "<leader>",
    config = function()
      require("util.whichkey")
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    key = "<leader>t",
    config = function()
      require("util.toggleterm")
    end,
  },

  -- --------------- Syntax ---------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
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
      require("syntax.treesitter")
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("syntax.autopairs")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("syntax.blankline")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    config = function()
      require("syntax.colorizer")
    end,
  },
},

  -- --------------- VimTeX ---------------
  {
    "lervag/vimtex",
    ft = {"latex", "tex", "bib"},
    lazy = true,
    config = function()
      require("util.vimtex")
    end
  }
