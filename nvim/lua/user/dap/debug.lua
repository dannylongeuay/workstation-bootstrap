local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local python = require("user.dap.lang.python")
local go = require("user.dap.lang.go")

local test_info_map = {
	["python"] = python.test_info_python,
	["go"] = go.test_info_go,
}

local test_dap_config_map = {
	["python"] = python.test_dap_config_python,
	["go"] = go.test_dap_config_go,
}

local debug_function = function()
	local lang = vim.bo.filetype
	local test_pattern, test_name = test_info_map[lang]()
	if not test_pattern then
		print("no function or method found to debug at cursor")
		return
	end
	if not string.lower(test_name):match("^test") then
		print("not a valid test to debug at cursor, must start with 'Test' or 'test'")
		return
	end
	dap.run(test_dap_config_map[lang](test_pattern))
end

vim.api.nvim_add_user_command("DebugFunction", debug_function, {})
