local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local python = require("user.dap.lang.python")
local go = require("user.dap.lang.go")
local javascript = require("user.dap.lang.javascript")

local test_info_map = {
	["python"] = python.get_test_info,
	["go"] = go.get_test_info,
	-- ["javascript"] = javascript.get_test_info,
	-- ["typescript"] = javascript.get_test_info,
}

local test_dap_config_map = {
	["python"] = python.get_test_dap_config,
	["go"] = go.get_test_dap_config,
	-- ["javascript"] = javascript.get_test_dap_config,
	-- ["typescript"] = javascript.get_test_dap_config,
}

local debug_function = function()
	local lang = vim.bo.filetype
	if test_info_map[lang] == nil then
		print(lang .. " not supported")
		return
	end
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
