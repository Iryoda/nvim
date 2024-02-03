local _, _ = pcall(require, "telescope.actions")
local ok, builtin = pcall(require, "telescope.builtin")

if not ok then
	return
end

require("telescope").setup()

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
