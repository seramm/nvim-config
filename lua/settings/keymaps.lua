M = {}

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Redefinition of Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

vim.api.nvim_set_keymap("n", "<C-Space>", "<cmd>WhichKey<cr>", opts)

-- Exit insert mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", opts)
vim.api.nvim_set_keymap("i", "kj", "<Esc>", opts)

-- Buffer navigation
keymap("n", "<S-h>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-k>", "<cmd>bprevious<cr>", opts)
keymap("n", "<S-l>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-j>", "<cmd>bnext<cr>", opts)
-- Split navigation
keymap("n", "<m-h>", "<C-w>h", opts)
keymap("n", "<m-j>", "<C-w>j", opts)
keymap("n", "<m-k>", "<C-w>k", opts)
keymap("n", "<m-l>", "<C-w>l", opts)
-- Split resize
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- LSP
keymap("n", "gf", "<cmd>lua vim.lsp.buf.format{async = true}<cr>", opts)
