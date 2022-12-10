-- CATPPUCIN
require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	transparent_background = false,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	no_italic = false, -- Force no italic
	no_bold = false, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		functions = { "italic" },
		variables = { "italic" },
		booleans = { "bold" },
		loops = {},
		keywords = {},
		strings = {},
		numbers = {},
		properties = {},
		types = {},
		operators = {},
	},
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = { "italic" },
			hints = { "italic" },
			warnings = { "italic" },
			information = { "italic" },
		},
		underlines = {
			errors = { "underline" },
			hints = { "underline" },
			warnings = { "underline" },
			information = { "underline" },
		},
	},
	color_overrides = {},

	integrations = {
		treesitter = true,
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		ts_rainbow = true,
		lsp_saga = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
	custom_highlights = function(cp)
		return {
			-- For native lsp configs.
			LspFloatWinNormal = { bg = cp.base },
			DiagnosticVirtualTextError = { bg = cp.none },
			DiagnosticVirtualTextWarn = { bg = cp.none },
			DiagnosticVirtualTextInfo = { bg = cp.none },
			DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

			["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
			["@tag"] = { fg = cp.blue },
			["@tag.delimiter"] = { fg = cp.maroon },
		}
	end,
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin")
