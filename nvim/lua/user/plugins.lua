local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- general
	use("wbthomason/packer.nvim") -- packerception
	use("nvim-lua/plenary.nvim") -- lua function library
	use("antoinemadec/FixCursorHold.nvim") -- Needed while issue https://github.com/neovim/neovim/issues/12587 is open

	-- QoL
	use("windwp/nvim-autopairs") -- autopairs, integrates with cmp and treesitter
	use({ -- smarter comments
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use("famiu/bufdelete.nvim") -- sane bdelete and bwipeout commands
	use("nvim-lualine/lualine.nvim") -- fast statusline
	use("akinsho/toggleterm.nvim") -- toggle and persist terminals
	use("lukas-reineke/indent-blankline.nvim") -- indentation line guides
	use({ "goolord/alpha-nvim", config = 'require("user.alpha")' }) -- customizable greeter
	use("folke/which-key.nvim") -- keybindings popup
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install" }) -- markdown previewer with mermaid js support
	use("karb94/neoscroll.nvim") -- smooth scrolling
	use("ggandor/lightspeed.nvim") -- motion plugin
	use("Shatur/neovim-session-manager") -- automatic session management
	use("stevearc/qf_helper.nvim") -- quickfix improvements

	-- themes
	use("lunarvim/darkplus.nvim") -- VSCode-like colorscheme
	use("folke/tokyonight.nvim") -- clean, dark theme
	use("kyazdani42/nvim-web-devicons") -- devicons for nvim-tree

	-- completion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- lsp completions
	use("hrsh7th/cmp-nvim-lua") -- neovim lua api completions

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- LSP server configuration
	use("b0o/schemastore.nvim") -- json schemastore catalog access

	-- nav
	use("nvim-telescope/telescope.nvim") -- file fuzzy finder
	use("nvim-telescope/telescope-ui-select.nvim") -- use telescope picker for neovim selections
	use("kyazdani42/nvim-tree.lua") -- better file explorer
	use("akinsho/bufferline.nvim") -- buffer line with minimal tab integration

	-- Treesitter
	use({ -- syntax highlighting
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("SmiteshP/nvim-gps") -- context on current cursor position
	use("towolf/vim-helm") -- helm syntax highlighting

	-- Git
	use("lewis6991/gitsigns.nvim") -- gitgutter signs

	-- code quality
	use("jose-elias-alvarez/null-ls.nvim") -- linting and formatting integration with LSP

	-- performance
	use("lewis6991/impatient.nvim") -- cache plugins

	-- testing/debugging
	use("klen/nvim-test") -- test runner
	use("mfussenegger/nvim-dap") -- debug adapter protocol cilent
	use("rcarriga/nvim-dap-ui") -- dap ui extension

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
