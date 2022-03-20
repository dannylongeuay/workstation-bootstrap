local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

require("user.dap.dapui")

--[[ Python ]]
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

local filter_nil = function(items)
	return vim.tbl_filter(function(x)
		return x
	end, items)
end

local get_function_name = function()
	local gps_status_ok, gps = pcall(require, "nvim-gps")
	if not gps_status_ok or not gps.is_available() then
		return nil, nil, nil
	end
	local data = gps.get_data()
	local classname = nil
	local funcname = nil
	local methodname = nil
	for _, node in ipairs(data) do
		if node.type == "class-name" then
			classname = node.text
		end
		if node.type == "function-name" then
			funcname = node.text
		end
		if node.type == "method-name" then
			methodname = node.text
		end
	end
	return funcname, classname, methodname
end

local debug_python_function = function()
	local funcname, classname, methodname = get_function_name()
	local test_pattern = funcname
	if classname and methodname then
		test_pattern = classname .. " and " .. methodname
	elseif classname then
		test_pattern = classname
	end
	if not test_pattern then
		print("no function or method found to debug at cursor")
		return
	end
	if not string.lower(test_pattern):match("^test") then
		print("not a valid test to debug at cursor, must start with 'Test' or 'test'")
		return
	end
	dap.run({
		type = "python",
		request = "launch",
		name = table.concat({ "Debug", test_pattern }, " "),
		module = "pytest",
		args = { "-k", test_pattern },
	})
end

local debug_go_function = function()
	local funcname, _, methodname = get_function_name()
	local test_pattern = funcname
	local test_name = funcname
	if methodname then
		test_pattern = ".../" .. methodname
		test_name = methodname
	end
	if not test_pattern then
		print("no function or method found to debug at cursor")
		return
	end
	if not string.lower(test_name):match("^test") then
		print("not a valid test to debug at cursor, must start with 'Test' or 'test'")
		return
	end
	dap.run({
		type = "go",
		request = "launch",
		name = table.concat({ "Debug", test_pattern }, " "),
		mode = "test",
		program = "./${relativeFileDirname}",
		args = { "-test.v", "-test.run", test_pattern },
	})
end

local debug_map = {
	["python"] = debug_python_function,
	["go"] = debug_go_function,
}

local debug_function = function()
	local lang = vim.bo.filetype
	debug_map[lang]()
end

vim.api.nvim_add_user_command("DebugFunction", debug_function, {})

--[[ Go ]]
dap.adapters.go = function(callback, _)
	local stdout = vim.loop.new_pipe(false)
	local handle
	local pid_or_err
	local port = 38697
	local opts = {
		stdio = { nil, stdout },
		args = { "dap", "-l", "127.0.01:" .. port },
		detached = true,
	}
	handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
		stdout:close()
		handle:close()
		if code ~= 0 then
			print("dlv exited with code", code)
		end
	end)
	assert(handle, "Error running dlv: " .. tostring(pid_or_err))
	stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require("dap.repl").append(chunk)
			end)
		end
	end)
	vim.defer_fn(function()
		callback({ type = "server", host = "127.0.0.1", port = port })
	end, 100)
end

dap.configurations.go = {
	{
		type = "go",
		request = "launch",
		name = "Debug package",
		program = "./${relativeFileDirname}",
	},
	{
		type = "go",
		request = "launch",
		name = "Debug tests",
		mode = "test",
		program = "./${relativeFileDirname}",
	},
}
