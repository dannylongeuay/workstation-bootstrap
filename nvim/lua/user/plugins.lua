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
	use({"wbthomason/packer.nvim", commit = "d268d2e083ca0abd95a57dfbcc5d5637a615e219"}) -- packerception
	use({"nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249"}) -- lua function library
	use({"antoinemadec/FixCursorHold.nvim", commit = "1bfb32e7ba1344925ad815cb0d7f901dbc0ff7c1"}) -- Needed while issue https://github.com/neovim/neovim/issues/12587 is open

	-- QoL
	use({"windwp/nvim-autopairs", commit = "4a95b3982be7397cd8e1370d1a09503f9b002dbf"}) -- autopairs, integrates with cmp and treesitter
	use({ -- smarter comments
		"numToStr/Comment.nvim",
		commit = "4086630ce2aaf76b2652516ee3169f0b558f6be1",
		config = function()
			require("Comment").setup()
		end,
	})
	use({"famiu/bufdelete.nvim", commit = "46255e4a76c4fb450a94885527f5e58a7d96983c"}) -- sane bdelete and bwipeout commands
	use({"nvim-lualine/lualine.nvim", commit = "5113cdb32f9d9588a2b56de6d1df6e33b06a554a"}) -- fast statusline
	use({"akinsho/toggleterm.nvim", commit = "04174e19196ecef43dd159b29d4e6ddb07b80909"}) -- toggle and persist terminals
	use({"lukas-reineke/indent-blankline.nvim", commit = "4a58fe6e9854ccfe6c6b0f59abb7cb8301e23025"}) -- indentation line guides
	use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94", config = 'require("user.alpha")' }) -- customizable greeter
	use({"folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71"}) -- keybindings popup
	use({ "iamcco/markdown-preview.nvim", commit= "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96", run = "cd app && npm install" }) -- markdown previewer with mermaid js support
	use({"karb94/neoscroll.nvim", commit = "71c8fadd60362383e5e817e95f64776f5e2737d8"}) -- smooth scrolling
	use({"ggandor/lightspeed.nvim", commit = "79519bfae95741bc99872582ef0f268fd842115b"}) -- motion plugin
	use({"Shatur/neovim-session-manager", commit = "9652b392805dfd497877342e54c5a71be7907daf"}) -- automatic session management
	use({"stevearc/qf_helper.nvim", commit = "84ca8af5f272a5c0e3ca30e287a0b9219e23a774"}) -- quickfix improvements

	-- themes
	use({"folke/tokyonight.nvim", commit = "8223c970677e4d88c9b6b6d81bda23daf11062bb"}) -- clean, dark theme
	use({"kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e"}) -- devicons for nvim-tree

	-- completion
	use({"hrsh7th/nvim-cmp", commit = "9897465a7663997b7b42372164ffc3635321a2fe"}) -- completion plugin
	use({"hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323"}) -- buffer completions
	use({"hrsh7th/cmp-path", commit = "981baf9525257ac3269e1b6701e376d6fbff6921"}) -- path completions
	use({"hrsh7th/cmp-cmdline", commit = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252"}) -- cmdline completions
	use({"saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36"}) -- snippet completions
	use({"hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8"}) -- lsp completions
	use({"hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21"}) -- neovim lua api completions

	-- snippets
	use({"L3MON4D3/LuaSnip", commit = "295cc9e422060b3200234b42cbee6dde1dfee765"}) --snippet engine
	use({"rafamadriz/friendly-snippets", commit = "688691050074f39e6ec987321738494e08ba562e"}) -- a bunch of snippets to use

	-- LSP
	use({"neovim/nvim-lspconfig", commit = "83dceed599b1236de4c18e31db3e0a0878b6fb59"}) -- enable LSP
	use({"williamboman/nvim-lsp-installer", commit = "c13ea61d85e2170af35c06b47bcba143cf2f244b"}) -- simple to use language server installer
	use({"tamago324/nlsp-settings.nvim", commit = "9a7eb99360b9ec846001467cf80019c089a7254f"}) -- LSP server configuration
	use({"b0o/schemastore.nvim", commit = "e936d016c448388f88ff7ae46b96cf0687304776"}) -- json schemastore catalog access

	-- nav
	use({"nvim-telescope/telescope.nvim", commit = "7df95f9b208ba7228a25e7f75fb4cc02d6604cce"}) -- file fuzzy finder
	use({"nvim-telescope/telescope-ui-select.nvim", commit = "62ea5e58c7bbe191297b983a9e7e89420f581369"}) -- use telescope picker for neovim selections
	use({"kyazdani42/nvim-tree.lua", commit = "21516f447baf42f6f11421a017cd69306d5d5ff3"}) -- better file explorer
	use({"akinsho/bufferline.nvim", commit = "68839d62785edfb4ff7a7b3c1e9f4b64d55749e8"}) -- buffer line with minimal tab integration

	-- Syntax
	use({"nvim-treesitter/nvim-treesitter", commit = "78931d8bf15468d8f11f0c7910d470e88493b36b"}) -- language highlighting
	use({"SmiteshP/nvim-gps", commit = "be4bb5b903af81f04b316425b8ba8142504d023f"}) -- context on current cursor position
	use({"towolf/vim-helm", commit = "86a63d007ffee156d759061850cda9d8daa8ea12"}) -- helm syntax highlighting

	-- Git
	use({"lewis6991/gitsigns.nvim", commit = "4883988cf8b623f63cc8c7d3f11b18b7e81f06ff"}) -- gitgutter signs

	-- code quality
	use({"jose-elias-alvarez/null-ls.nvim", commit = "a2b7bf89663c78d58a5494efbb791819a24bb025"}) -- linting and formatting integration with LSP

	-- performance
	use({"lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350"}) -- cache plugins

	-- debugging
	use({"mfussenegger/nvim-dap", commit = "f4a3be57f61893cffa1e22aa5e1e7bded495fcf2"}) -- debug adapter protocol cilent
	use({"rcarriga/nvim-dap-ui", commit = "d33b905770f9c674468b0b83bed3aeab41cf9bb0"}) -- dap ui extension

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
