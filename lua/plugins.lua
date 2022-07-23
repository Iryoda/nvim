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
	use("p00f/nvim-ts-rainbow")
	use("norcalli/nvim-colorizer.lua")
	use("karb94/neoscroll.nvim")
	use("jiangmiao/auto-pairs")
	use("tree-sitter/tree-sitter")
	use("terrortylor/nvim-comment")
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	})
	-- Clojure
	use("Olical/conjure")
	use("tpope/vim-dispatch")
	use("clojure-vim/vim-jack-in")
	use("radenling/vim-dispatch-neovim")

	-- Theme
	use("marko-cerovac/material.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("tami5/lspsaga.nvim")
	use("williamboman/nvim-lsp-installer")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- COMP
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- "hrsh7th/vim-vsnip",
			-- "hrsh7th/vim-vsnip-integ",
		},
	})

	-- SNIPPETS
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- GIT
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use({
		"hoob3rt/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
end)
