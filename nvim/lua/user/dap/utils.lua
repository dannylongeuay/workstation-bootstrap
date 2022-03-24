local M = {}

M.get_gps_info = function()
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

M.term_exec_cmd = function(cmd)
	local tt_status_ok, tt = pcall(require, "toggleterm")
	if not tt_status_ok then
		print("toggleterm is required to execute commands")
		return
	end
	tt.exec(cmd, 0, 96, "", "vertical", false, true)
end

return M
