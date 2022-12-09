local _, custom = pcall(require, "lualine.themes.catppuccin")
local ok, catpallete = pcall(require, "catppuccin.palettes")

if not ok then
	return
end

local C = catpallete.get_palette("macchiato")

custom.normal = {
	a = { bg = C.base, fg = C.text, gui = "bold" },
	b = { bg = C.base, fg = C.teal },
	c = { bg = C.base, fg = C.text },
	y = { bg = C.base, fg = C.text },
	z = { bg = C.base, fg = C.text },
}

custom.insert = {
	a = { bg = C.base, fg = C.green, gui = "bold" },
	z = { bg = C.base, fg = C.text },
}

custom.command = {
	a = { bg = C.base, fg = C.peach, gui = "bold" },
	z = { bg = C.base, fg = C.text },
}

custom.visual = {
	a = { bg = C.base, fg = C.mauve, gui = "bold" },
	z = { bg = C.base, fg = C.text },
}

custom.replace = {
	a = { bg = C.base, fg = C.red, gui = "bold" },
	z = { bg = C.base, fg = C.text },
}

custom.inactive = {
	a = { bg = C.base, fg = C.blue },
	b = { bg = C.base, fg = C.text, gui = "bold" },
	c = { bg = C.base, fg = C.overlay0 },
}

return custom
