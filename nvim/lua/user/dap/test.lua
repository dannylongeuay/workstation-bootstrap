local python = require("user.dap.lang.python")
local go = require("user.dap.lang.go")
local javascript = require("user.dap.lang.javascript")

local utils = require("user.dap.utils")

local test_info_map = {
	["python"] = python.get_test_info,
	["go"] = go.get_test_info,
	["javascript"] = javascript.get_test_info,
	["typescript"] = javascript.get_test_info,
}

local test_cmd_map = {
	["python"] = python.get_test_cmd,
	["go"] = go.get_test_cmd,
	["javascript"] = javascript.get_test_cmd,
	["typescript"] = javascript.get_test_cmd,
}

local test_function = function()
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
	utils.term_exec_cmd(test_cmd_map[lang](test_pattern))
end

vim.api.nvim_create_user_command("TestFunction", test_function, {})
