local ok, lspsaga = pcall(require, "lspsaga")
-- local ok, catpuccinIntegrations = pcall(require, "catppuccin.groups.integrations.lsp_saga")

if not ok then
	return
end

lspsaga.setup({
	symbol_in_winbar = {
		enable = false,
	},
})

-- lspsaga.setup({
-- 	preview = {
-- 		lines_above = 0,
-- 		lines_below = 10,
-- 	},
-- 	scroll_preview = {
-- 		scroll_down = "<C-f>",
-- 		scroll_up = "<C-b>",
-- 	},
-- 	request_timeout = 2000,
-- 	ui = {
-- 		-- currently only round theme
-- 		theme = "round",
-- 		-- this option only work in neovim 0.9
-- 		title = true,
-- 		-- border type can be single,double,rounded,solid,shadow.
-- 		border = "rounded",
-- 		winblend = 0,
-- 		expand = "",
-- 		collapse = "",
-- 		preview = " ",
-- 		code_action = "💡",
-- 		diagnostic = "🐞",
-- 		incoming = " ",
-- 		outgoing = " ",
-- 		colors = {
-- 			--float window normal background color
-- 			normal_bg = "#1E1E2E",
-- 			--title background color
-- 			title_bg = "#A6ADC7",
-- 			red = "#F38BA8",
-- 			magenta = "#EBA0AC",
-- 			orange = "#FF8700",
-- 			yellow = "#F9E2AF",
-- 			green = "#A6E3A1",
-- 			cyan = "#89DCEB",
-- 			blue = "#89B4FA",
-- 			purple = "#CBA6F7",
-- 			white = "#CDD6F4",
-- 			black = "#1c1c19",
-- 		},
-- 		kind = {},
-- 	},
-- 	symbol_in_winbar = {
-- 		enable = false,
-- 		separator = " ",
-- 		hide_keyword = true,
-- 		show_file = true,
-- 		folder_level = 2,
-- 		respect_root = false,
-- 		color_mode = true,
-- 	},
-- })
