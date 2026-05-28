local ok, fff = pcall(require, "fff")

if not ok then
	return
end

fff.setup({
	prompt = "> ",
})

local function buffer_search()
	fff.find_files({ title = "Buffers" })
end

vim.keymap.set("n", "<leader>ff", function()
	fff.find_files()
end, { desc = "FFFind files" })

vim.keymap.set("n", "<leader><leader>", function()
	fff.find_files()
end, { desc = "FFFind files (quick)" })

vim.keymap.set("n", "<Space><Space>", function()
	fff.find_files()
end, { desc = "FFFind files (quick)" })

vim.keymap.set("n", "SS", function()
	fff.find_files()
end, { desc = "FFFind files (shift-shift style)" })

vim.keymap.set("n", "<leader>fg", function()
	fff.live_grep()
end, { desc = "LiFFFe grep" })

vim.keymap.set("n", "<leader>fz", function()
	fff.live_grep({ grep = { modes = { "fuzzy", "plain" } } })
end, { desc = "Live fffuzy grep" })

vim.keymap.set("n", "<leader>fc", function()
	fff.live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "Search current word" })

vim.keymap.set("n", "<leader>fb", buffer_search, { desc = "Search buffers" })
