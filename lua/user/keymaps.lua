M = {}

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Redefinition of Leader key
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<C-Space>", "<cmd>WhichKey<cr>", opts)
