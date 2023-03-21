M = {}

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Redefinition of Leader key
vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<C-Space>", "<cmd>WhichKey<cr>", opts)

-- Exit insert mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", opts)
vim.api.nvim_set_keymap("i", "kj", "<Esc>", opts)

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-k>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-j>", "<cmd>bnext<cr>", opts)
