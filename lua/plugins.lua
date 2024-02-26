return {
  -- --------------- Basic Plugins ---------------
  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
  },

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
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("ui.noice")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = "Telescope",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("util.telescope")
    end,
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
    lazy = true,
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
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
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("lsp.lsp")
    end,
    dependencies = {
      { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    },
  },
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
  },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "nvimtools/none-ls.nvim",
    cmd = { "NullLsInfo" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lsp.null-ls")
    end,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "onsails/lspkind.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- --------------- Completition ---------------
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    config = function()
      require("lsp.cmp")
    end,
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", lazy = true },
      { "hrsh7th/cmp-buffer", lazy = true },
      { "hrsh7th/cmp-path", lazy = true },
      { "saadparwaiz1/cmp_luasnip", lazy = true },
      {
        "hrsh7th/cmp-cmdline",
        lazy = true,
        event = "CmdlineEnter",
      },
    },
  },
  -- --------------- Snippets ---------------
  {
    "L3MON4D3/LuaSnip",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      require("lsp.luasnip")
    end,
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
    lazy = true,
    event = "VeryLazy",
    cmd = "WhichKey",
    key = "<leader>",
    config = function()
      require("util.whichkey")
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
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
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("syntax.blankline")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("syntax.colorizer")
    end,
  },

  -- --------------- VimTeX ---------------
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      require("util.vimtex")
    end,
  },
}
