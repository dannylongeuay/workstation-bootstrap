local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local utils = require("user.dap.utils")

local M = {}

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/.local/share/debuggers/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		type = "node2",
		request = "launch",
		name = "Debug file",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		-- console = "integratedTerminal",
	},
}

M.get_test_info = function()
	local _, _, methodname = utils.get_gps_info()
	local test_pattern = methodname
	-- TODO: need to ensure the function name starts with test or it
	local test_name = "test"
	return test_pattern, test_name
end

M.get_test_dap_config = function(test_pattern)
	return {
		type = "node2",
		request = "launch",
		name = table.concat({ "Debug", test_pattern }, " "),
		runtimeArgs = { "--inspect-brk", "node_modules/.bin/jest", "--no-coverage" },
		args = { "--no-cache" },
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
	}
end

M.get_test_cmd = function(test_pattern)
	return table.concat({ "node_modules/.bin/jest", "-t", test_pattern }, " ")
end

return M
