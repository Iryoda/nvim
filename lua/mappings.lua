local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
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
map("n", "<c-s>", ":up<CR>")
map("i", "<c-s>", "<ESC>:up<CR>a")
map("n", "<c-z>", "u", {})
map("n", "<Leader>w", "up<CR>")

-- User <c-Key> to change the buffer when split
map("n", "<c-j>", "<c-w>j")
map("n", "<c-h>", "<c-w>h")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", {silent = true})

--Select all file
-- map("n", "<c-a>", "ggVG<c-$>")

-- Tab to switch buffers in Normal mode
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- NvimTree
map("n", "<C-e>", ":NvimTreeToggle<CR>")
map("n", "<Leader>tr", ":NvimTreeRefresh<CR>")
map("n", "<Leader>n", ":NvimTreeFindFile<CR>")

-- Stop Nvim
map("n", "<Leader>z", ":stop<CR>")
