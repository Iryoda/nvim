local _, lualine = pcall(require, "lualine")
local ok, catppuccin = pcall(require, "configs/lua_line_custom_theme/catppuccin")

if not ok then
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		-- theme = "palenight",
		theme = catppuccin,
		component_separators = " ",
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},

	winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ "filetype", icon_only = true, separator = "", padding = { left = "1" } },
			"filename",
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_winbar = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ "filetype", colored = false, icon_only = true, separator = "", padding = { left = "1" } },
			"filename",
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},

	extensions = {},
})
