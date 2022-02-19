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
require("material").setup({
	italics = {
		comments = true, -- Enable italic comments
		keywords = true, -- Enable italic keywords
		functions = true, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false, -- Enable italic variables
	},
	disable = {
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false, -- Hide the end-of-buffer lines
	},
})

vim.cmd([[colorscheme material]])
