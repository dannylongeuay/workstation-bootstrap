local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local file_exists = function(file)
	local f = io.open(file, "rb")
	if f then
		f:close()
	end
	return f ~= nil
end

local file_contains_pattern = function(file, pattern)
	if not file_exists(file) then
		return nil
	end
	for line in io.lines(file) do
		if string.match(line, pattern) then
			return true
		end
	end
	return nil
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	cmd = { "nvim" },
	debounce = 250,
	debug = false,
	default_timeout = 5000,
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log = {
		enable = true,
		level = "warn",
		use_console = "async",
	},
	on_attach = nil,
	on_init = nil,
	on_exit = nil,
	update_in_insert = false,
	sources = {
		formatting.black.with({
			condition = function()
				return file_contains_pattern("pyproject.toml", "black =")
			end,
		}),
		formatting.prettier,
		formatting.stylua,
		formatting.yapf.with({
			condition = function()
				return file_contains_pattern("pyproject.toml", "yapf =")
			end,
		}),
		diagnostics.eslint,
		diagnostics.flake8.with({
			condition = function()
				return file_contains_pattern("pyproject.toml", "flake8 =")
			end,
		}),
		diagnostics.golangci_lint,
		diagnostics.pylint.with({
			timeout = 20000, -- pylint is slow
			condition = function()
				return file_contains_pattern("pyproject.toml", "pylint =")
			end,
		}),
	},
})
