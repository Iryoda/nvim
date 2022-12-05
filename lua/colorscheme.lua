-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- vim.g.tokyonight_transparent = false
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.terminal_colors = false
-- -- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
--
-- -- Load the colorscheme
-- vim.cmd([[colorscheme tokyonight]])

vim.g.material_style = "deep ocean"
--

local ok, material = pcall(require, "material")

if not ok then
	return
end

material.setup({
	contrast = {
		floating_window = false,
		sidebars = false,
		non_current_window = true,
	},
	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		-- "dap",
		-- "dashboard",
		"gitsigns",
		-- "hop",
		-- "indent-blankline",
		"lspsaga",
		-- "mini",
		-- "neogit",
		"nvim-cmp",
		-- "nvim-navic",
		"nvim-tree",
		"nvim-web-devicons",
		-- "sneak",
		"telescope",
		-- "trouble",
		-- "which-key",
	},
	styles = { -- Give comments style such as bold, italic, underline etc.
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		strings = {},
		variables = {},
		operators = {},
		types = {},
	},
	high_visibility = {
		darker = true, -- Enable higher contrast text for darker style
	},
	disable = {
		colored_cursor = true,
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false, -- Hide the end-of-buffer lines
	},
	-- lualine_style = "stealth",
})

vim.cmd([[colorscheme material]])
