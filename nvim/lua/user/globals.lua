P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

FITLER_NIL = function(items)
	return vim.tbl_filter(function(x)
		return x
	end, items)
end
