vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("plugins")
require("options")
require("config")
require("lsp")
require("mappings")
require("colorscheme")

vim.cmd([[hi rainbowcol1 guifg=#84FFFF]])
