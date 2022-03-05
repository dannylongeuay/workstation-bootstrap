local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Leader --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Window nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Buffers
keymap("n", "<S-h>", ":bprevious<cr>", opts)
keymap("n", "<S-l>", ":bnext<cr>", opts)

-- Diagnostics
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- Visual --
-- Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Persist paste register
keymap("v", "p", '"_dP', opts)
