local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Leader --
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Normal ]]
-- Window nav
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<cr>", opts)

-- Buffers
keymap("n", "<S-h>", ":bprevious<cr>", opts)
keymap("n", "<S-l>", ":bnext<cr>", opts)

-- Comments
keymap("n", "gc", "<CMD>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("n", "gb", "<CMD>lua require('Comment.api').toggle_current_blockwise()<CR>", opts)

-- Diagnostics
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

-- Git
keymap("n", "]g", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", opts)
keymap("n", "[g", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", opts)

--[[ Visual ]]
-- Continuous Indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Persist paste register
keymap("v", "p", '"_dP', opts)

-- Comments
keymap("v", "gc", "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)
keymap("v", "gb", "<ESC><CMD>lua require('Comment.api').toggle_blockwise_op(vim.fn.visualmode())<CR>", opts)
