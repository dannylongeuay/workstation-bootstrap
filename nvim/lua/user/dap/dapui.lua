local ui_status_ok, dap_ui = pcall(require, "dapui")
if not ui_status_ok then
	return
end

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

dap_ui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	sidebar = {
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.30, -- Can be float or integer > 1
			},
			{ id = "watches", size = 0.30 },
			{ id = "stacks", size = 0.20 },
			{ id = "breakpoints", size = 0.20 },
		},
		size = 80,
		position = "left", -- Can be "left", "right", "top", "bottom"
	},
	tray = {
		elements = { "repl" },
		size = 15,
		position = "bottom", -- Can be "left", "right", "top", "bottom"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

local M = {}

M.buffer = nil

dap.listeners.after.event_initialized["dapui_config"] = function()
	dap_ui.open()
	M.buffer = vim.api.nvim_get_current_buf()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dap_ui.close()
	dap.repl.close()
	if M.buffer then
		vim.api.nvim_set_current_buf(M.buffer)
		M.buffer = nil
	end
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dap_ui.close()
	dap.repl.close()
	if M.buffer then
		vim.api.nvim_set_current_buf(M.buffer)
		M.buffer = nil
	end
end
