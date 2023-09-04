local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Better Command
map("n", ";", ":")
map("v", ";", ":")

-- H and L for end line
map("n", "H", "^")
map("n", "L", "$")

-- Better Save methods
vim.keymap.set({ "n", "i" }, "<c-s>", "<cmd>update<cr>", { silent = true })
vim.keymap.set("v", "<c-s>", "<cmd>update<cr>gv", { silent = true })
vim.keymap.set("n", "<leader>s", "<cmd>update<cr>", { silent = true })

-- User <c-Key> to change the buffer when split
map("n", "<c-j>", "<c-w>j")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- NvimTree
map("n", "<C-e>", ":NvimTreeToggle<CR>")
map("n", "<Leader>tr", ":NvimTreeRefresh<CR>")
map("n", "<Leader>n", ":NvimTreeFindFile<CR>")

-- Stop Nvim
map("n", "<C-z>", "")
map("n", "<Leader>z", ":stop<CR>")

-- C-d and C-u stay on the middle
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better yank for more control: AKA greatest remaps ever
-- stylua: ignore start
map("n", "<leader>p", "_dP")

map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")
map("n", "<leader>D", "\"_D")
