vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("plugins")
require("options")
require("config")
require("lsp")
require("mappings")
require("colorscheme")

-- vim.g.highlight("rainbowcol1", "#89DDFF")
