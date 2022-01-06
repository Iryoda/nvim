local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	-- Utils
	use("karb94/neoscroll.nvim")
	use("pantharshit00/vim-prisma")
	use("jiangmiao/auto-pairs")
	use("tree-sitter/tree-sitter")
	use("terrortylor/nvim-comment")

	-- Theme
	use("folke/tokyonight.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("tami5/lspsaga.nvim")
	use("williamboman/nvim-lsp-installer")
	use("L3MON4D3/LuaSnip")

	-- COMP
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
end)
