local uv = vim.uv or vim.loop
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- MINI
    "echasnovski/mini.nvim",
    "echasnovski/mini.icons",

    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({})
        end,
    },

    -- Copilot
    "github/copilot.vim",

    -- Lint
    "mfussenegger/nvim-lint",

    -- Format
    "stevearc/conform.nvim",

	-- use({ "nvim-treesitter/nvim-treesitter-context" })

	-- Treesitter (Better colors)
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
    },

    -- Utils
    "norcalli/nvim-colorizer.lua", -- Make hex colors appears
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },

    "terrortylor/nvim-comment", -- Godly plugin

    -- Theme
    -- use("marko-cerovac/material.nvim")
    {
        "catppuccin/nvim",
        name = "catppuccin",
    },

    -- LSP
    "onsails/lspkind-nvim",
    "nvimdev/lspsaga.nvim",

    -- GIT
    {
        "lewis6991/gitsigns.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {
        "kyazdani42/nvim-tree.lua",
        dependencies = "kyazdani42/nvim-web-devicons",
    },

    {
        "hoob3rt/lualine.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
    },

    {
        "dmtrKovalenko/fff.nvim",
        build = function()
            require("fff.download").download_or_build_binary()
        end,
    },
}, {
    defaults = {
        lazy = false,
    },
})
