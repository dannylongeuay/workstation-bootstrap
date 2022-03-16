local wrap_group = vim.api.nvim_create_augroup("_wrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = wrap_group,
	pattern = { "markdown", "gitcommit", "qf" },
	callback = function()
		vim.schedule(function()
			vim.cmd("setlocal wrap")
		end)
	end,
})

local spell_group = vim.api.nvim_create_augroup("_spell", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = spell_group,
	pattern = { "markdown", "gitcommit" },
	callback = function()
		vim.schedule(function()
			vim.cmd("setlocal spell")
		end)
	end,
})

local format_group = vim.api.nvim_create_augroup("_autoformat", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = format_group,
	command = ":silent lua vim.lsp.buf.formatting_sync({}, 1000)",
})
