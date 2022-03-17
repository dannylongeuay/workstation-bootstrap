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

local debug_function = function()
	local gps_status_ok, gps = pcall(require, "nvim-gps")
	if not gps_status_ok or not gps.is_available() then
		return
	end
	local data = gps.get_data()
	P(data)
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
