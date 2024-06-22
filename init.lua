vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("plugins")
require("options")
require("config")
require("new_lsp")
require("mappings")
require("colorscheme")

-- vim.cmd([[hi rainbowcol1 guifg=#84FFFF]])
--
