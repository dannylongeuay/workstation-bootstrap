local status_ok, nvim_test = pcall(require, "nvim-test")
if not status_ok then
	return
end

nvim_test.setup({
	commands_create = true, -- create commands (TestFile, TestLast, ...)
	silent = false, -- less notifications
	run = true, -- run test commands
	term = "toggleterm", -- a terminal to run (terminal|toggleterm)
	termOpts = {
		direction = "float", -- terminal's direction (horizontal|vertical|float)
		width = 96, -- terminal's width (for vertical|float)
		height = 24, -- terminal's height (for horizontal|float)
		go_back = false, -- return focus to original window after executing
		stopinsert = false, -- exit from insert mode
		keep_one = true, -- only for term 'terminal', use only one buffer for testing
	},
	runners = { -- setup tests runners
		go = "nvim-test.runners.go-test",
		javascript = "nvim-test.runners.jest",
		lua = "nvim-test.runners.busted",
		python = "nvim-test.runners.pytest",
		rust = "nvim-test.runners.cargo-test",
		typescript = "nvim-test.runners.jest",
	},
})
