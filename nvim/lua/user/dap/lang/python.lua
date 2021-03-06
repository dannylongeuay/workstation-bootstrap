local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local utils = require("user.dap.utils")

local M = {}

dap.adapters.python = {
	type = "executable",
	command = "python",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Debug file",
		program = "${file}",
		pythonPath = "python",
	},
	{
		type = "python",
		request = "launch",
		name = "Debug tests",
		module = "pytest",
	},
}

M.get_test_info = function()
	local funcname, classname, methodname = utils.get_gps_info()
	local test_pattern = funcname
	local test_name = funcname
	if classname and methodname then
		test_pattern = classname .. " and " .. methodname
		test_name = methodname
	elseif classname then
		test_pattern = classname
		test_name = classname
	end
	return test_pattern, test_name
end

M.get_test_dap_config = function(test_pattern)
	return {
		type = "python",
		request = "launch",
		name = table.concat({ "Debug", test_pattern }, " "),
		module = "pytest",
		args = { "-k", test_pattern },
	}
end

M.get_test_cmd = function(test_pattern)
	return table.concat({ "pytest", "-k", string.format("%q", test_pattern) }, " ")
end

return M
