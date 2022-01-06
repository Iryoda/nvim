vim.api.nvim_set_keymap("n", "<Space>", "", {})
vim.g.mapleader = " "

require("plugins")
require("options")
require("config")
require("lsp")
require("mappings")
require("colorscheme")

