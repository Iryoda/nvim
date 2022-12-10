local _, custom = pcall(require, "lualine.themes.catppuccin")
local ok, catpallete = pcall(require, "catppuccin.palettes")

if not ok then
	return
end

local C = catpallete.get_palette("mocha")

local base = C.base

custom.normal = {
	a = { bg = base, fg = C.subtext1, gui = "bold" },
	b = { bg = base, fg = C.teal },
	c = { bg = base, fg = C.subtext1 },
	y = { bg = base, fg = C.subtext1 },
	z = { bg = base, fg = C.subtext1 },
}

custom.insert = {
	a = { bg = base, fg = C.green, gui = "bold" },
	z = { bg = base, fg = C.subtext1 },
}

custom.command = {
	a = { bg = base, fg = C.peach, gui = "bold" },
	z = { bg = base, fg = C.subtext1 },
}

custom.visual = {
	a = { bg = base, fg = C.mauve, gui = "bold" },
	z = { bg = base, fg = C.subtext1 },
}

custom.replace = {
	a = { bg = base, fg = C.red, gui = "bold" },
	z = { bg = base, fg = C.subtext1 },
}

custom.inactive = {
	a = { bg = base, fg = C.blue },
	b = { bg = base, fg = C.subtext1, gui = "bold" },
	c = { bg = base, fg = C.overlay0 },
}

return custom
