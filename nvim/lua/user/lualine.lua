local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = false,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

local buffer_clients_and_sources = function()
	local clients_and_sources = {}
	local clients = vim.lsp.buf_get_clients()
	for _, client in pairs(clients) do
		if client.name ~= "null-ls" then
			table.insert(clients_and_sources, client.name)
		end
	end
	if #clients_and_sources == 0 then
		table.insert(clients_and_sources, "LS Inactive")
	end
	local null_ls_status_ok, null_ls = pcall(require, "null-ls")
	if null_ls_status_ok then
		for _, source in pairs(null_ls.get_sources()) do
			for k, v in pairs(source.filetypes) do
				if v and vim.bo.filetype == k then
					table.insert(clients_and_sources, source.name)
				end
			end
		end
	end
	return table.concat(clients_and_sources, ", ")
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = "|",
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { branch },
		lualine_b = { diff },
		lualine_c = { diagnostics },
		lualine_x = { buffer_clients_and_sources },
		lualine_y = { filetype },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	tabline = {},
	extensions = {},
})
