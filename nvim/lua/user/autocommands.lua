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

local function detach_yamlls()
	local clients = vim.lsp.get_active_clients()
	for client_id, client in pairs(clients) do
		if client.name == "yamlls" then
			vim.lsp.buf_detach_client(0, client_id)
		end
	end
end

local gotmpl_group = vim.api.nvim_create_augroup("_gotmpl", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = gotmpl_group,
	pattern = "yaml",
	callback = function()
		vim.schedule(function()
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			for _, line in ipairs(lines) do
				if string.match(line, "{{.+}}") then
					vim.defer_fn(detach_yamlls, 500)
					return
				end
			end
		end)
	end,
})
