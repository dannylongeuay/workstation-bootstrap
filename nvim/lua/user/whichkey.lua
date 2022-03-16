local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = false, -- shows a list of your marks on ' and `
		registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = false, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = false, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k", "g" },
		n = { "g" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["W"] = { "<cmd>wa!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["Q"] = { "<cmd>qa!<CR>", "Quit All" },
	["c"] = { "<cmd>Bdelete! %d<CR>", "Close Current Buffer" },
	["C"] = { "<cmd>%bdelete<CR>", "Close All Buffers" },
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	["f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	t = {
		name = "Test",
		n = { "<cmd>TestNearest<CR>", "Test Nearest" },
		f = { "<cmd>TestFile<CR>", "Test File" },
		s = { "<cmd>TestSuite<CR>", "Test Suite" },
		l = { "<cmd>TestLast<CR>", "Test Last" },
	},
	u = {
		name = "Text Utilities",
		s = { "<cmd>setlocal spell!<CR>", "Spell Check" },
		m = { "<cmd>call mkdp#util#toggle_preview()<CR>", "Markdown Preview" },
	},
	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
	},
	l = {
		name = "LSP",
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		u = { "<cmd>LspUpdateAll<cr>", "Update Outdated Servers" },
		j = {
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		n = { "<cmd>NullLsInfo<cr>", "Null LS Info" },
		t = { "<cmd>TSInstallInfo<cr>", "Tree Sitter Info" },
	},
	s = {
		name = "Search",
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},
	S = {
		name = "Session",
		s = { "<cmd>SessionManager! load_session<cr>", "Select Session" },
		l = { "<cmd>SessionManager! load_last_session<cr>", "Load Last Session" },
		c = { "<cmd>SessionManager! load_current_dir_session<cr>", "Load CWD Session" },
		S = { "<cmd>SessionManager! save_current_session<cr>", "Save CWD Session" },
		D = { "<cmd>SessionManager! delete_session<cr>", "Delete Session" },
	},
	T = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "node" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "python" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	I = {
		name = "Impatient",
		c = { "<cmd>LuaCacheClear<cr>", "Clear Cache" },
		l = { "<cmd>LuaCacheLog<cr>", "View Cache Log" },
		p = { "<cmd>LuaCacheProfile<cr>", "Profile" },
	},
	U = {
		name = "Quickfix",
		q = { "<cmd>QFToggle!<CR>", "Toggle Quickfix" },
		n = { "<cmd>QNext<CR>", "Next" },
		p = { "<cmd>QPrev<CR>", "Prev" },
	},
	B = {
		name = "Bufferline",
		e = { "<cmd>BufferLineSortByExtension<CR>", "Sort By Extension" },
		d = { "<cmd>BufferLineSortByDirectory<CR>", "Sort By Directory" },
		n = {
			"<cmd>lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.filename < buf_b.filename end)<CR>",
			"Sory By Name",
		},
		l = { "<cmd>BufferLineCloseRight<CR>", "Close All Buffers Right" },
		h = { "<cmd>BufferLineCloseLeft<CR>", "Close All Buffers Left" },
	},
	d = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		C = { "<cmd>lua require'dap'.clear_breakpoints()<CR>", "Clear Breakpoints" },
		q = { "<cmd>lua require'dap'.list_breakpoints()<CR>", "List Breakpoints" },
		c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		l = { "<cmd>lua require'dap'.run_last()<CR>", "Run Last" },
		t = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run To Cursor" },
		r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle REPL" },
		T = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate Session" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)