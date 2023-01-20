local _, lspsaga = pcall(require, "lspsaga")
local ok, catpuccinIntegrations = pcall(require, "catppuccin.groups.integrations.lsp_saga")

if not ok then
	return
end

lspsaga.setup({
	preview = {
		lines_above = 0,
		lines_below = 10,
	},
	scroll_preview = {
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	request_timeout = 2000,
	ui = {
		-- currently only round theme
		theme = "round",
		-- this option only work in neovim 0.9
		title = true,
		-- border type can be single,double,rounded,solid,shadow.
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		preview = " ",
		code_action = "💡",
		diagnostic = "🐞",
		incoming = " ",
		outgoing = " ",
		colors = {
			--float window normal background color
			normal_bg = "#1E1E2E",
			--title background color
			title_bg = "#A6ADC7",
			red = "#F38BA8",
			magenta = "#EBA0AC",
			orange = "#FF8700",
			yellow = "#F9E2AF",
			green = "#A6E3A1",
			cyan = "#89DCEB",
			blue = "#89B4FA",
			purple = "#CBA6F7",
			white = "#CDD6F4",
			black = "#1c1c19",
		},
		kind = {},
	},
})

-- lspsaga.old({
-- 	-- Options with default value
-- 	-- "single" | "double" | "rounded" | "bold" | "plus"
-- 	border_style = "rounded",
-- 	--the range of 0 for fully opaque window (disabled) to 100 for fully
-- 	--transparent background. Values between 0-30 are typically most useful.
-- 	saga_winblend = 0,
-- 	-- when cursor in saga window you config these to move
-- 	move_in_saga = { prev = "<C-p>", next = "<C-n>" },
-- 	diagnostic_header = { " ", " ", " ", "ﴞ " },
-- 	-- preview lines above of lsp_finder
-- 	preview_lines_above = 0,
-- 	-- preview lines of lsp_finder and definition preview
-- 	max_preview_lines = 10,
-- 	-- use emoji lightbulb in default
-- 	code_action_icon = " ",
-- 	-- if true can press number to execute the codeaction in codeaction window
-- 	code_action_num_shortcut = true,
-- 	-- same as nvim-lightbulb but async
-- 	code_action_lightbulb = {
-- 		enable = true,
-- 		enable_in_insert = true,
-- 		cache_code_action = true,
-- 		sign = true,
-- 		update_time = 150,
-- 		sign_priority = 20,
-- 		virtual_text = false,
-- 	},
-- 	-- finder icons
-- 	finder_icons = {
-- 		def = "  ",
-- 		ref = "諭 ",
-- 		link = "  ",
-- 	},
-- 	-- finder do lsp request timeout
-- 	-- if your project big enough or your server very slow
-- 	-- you may need to increase this value
-- 	finder_request_timeout = 1500,
-- 	finder_action_keys = {
-- 		open = { "o", "<CR>" },
-- 		vsplit = "s",
-- 		split = "i",
-- 		tabe = "t",
-- 		quit = { "q", "<ESC>" },
-- 	},
-- 	code_action_keys = {
-- 		quit = "q",
-- 		exec = "<CR>",
-- 	},
-- 	definition_action_keys = {
-- 		edit = "<C-c>o",
-- 		vsplit = "<C-c>v",
-- 		split = "<C-c>i",
-- 		tabe = "<C-c>t",
-- 		quit = "q",
-- 	},
-- 	rename_action_quit = "<C-c>",
-- 	rename_in_select = true,
-- 	-- show symbols in winbar must nightly
-- 	-- in_custom mean use lspsaga api to get symbols
-- 	-- and set it to your custom winbar or some winbar plugins.
-- 	-- if in_cusomt = true you must set in_enable to false
-- 	symbol_in_winbar = {
-- 		in_custom = false, -- false to enable
-- 		enable = false, -- true if in_custom false
-- 		separator = " > ",
-- 		show_file = true,
-- 		-- define how to customize filename, eg: %:., %
-- 		-- if not set, use default value `%:t`
-- 		-- more information see `vim.fn.expand` or `expand`
-- 		-- ## only valid after set `show_file = true`
-- 		file_formatter = "",
-- 		click_support = false,
-- 	},
-- 	-- show outline
-- 	show_outline = {
-- 		win_position = "right",
-- 		--set special filetype win that outline window split.like NvimTree neotree
-- 		-- defx, db_ui
-- 		win_with = "",
-- 		win_width = 30,
-- 		auto_enter = true,
-- 		auto_preview = true,
-- 		virt_text = "┃",
-- 		jump_key = "o",
-- 		-- auto refresh when change buffer
-- 		auto_refresh = true,
-- 	},
-- 	-- custom lsp kind
-- 	-- usage { Field = 'color code'} or {Field = {your icon, your color code}}
-- 	custom_kind = catpuccinIntegrations.custom_kind(),
--
-- 	-- if you don't use nvim-lspconfig you must pass your server name and
-- 	-- the related filetypes into this table
-- 	-- like server_filetype_map = { metals = { "sbt", "scala" } }
-- 	server_filetype_map = {},
-- })
