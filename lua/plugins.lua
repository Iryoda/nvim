local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
	execute("packadd packer.nvim")
end

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "saadparwaiz1/cmp_luasnip" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	--
	use({
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").setup({})
		end,
	})

	-- Copilot
	use("github/copilot.vim")

	-- Lint
	use("mfussenegger/nvim-lint")

	-- Format
	use({
		"stevearc/conform.nvim",
	})

	use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Treesitter (Better colors)
	use("tree-sitter/tree-sitter")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Utils
	use("p00f/nvim-ts-rainbow")
	use("norcalli/nvim-colorizer.lua") -- Make hex colors appears
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("terrortylor/nvim-comment") -- Godly plugin

	-- Theme
	-- use("marko-cerovac/material.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- LSP
	use("onsails/lspkind-nvim")
	use("nvimdev/lspsaga.nvim")

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
