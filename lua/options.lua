local opt = vim.opt
vim.cmd([[let $NVIM_TUI_ENABLE_TRUE_COLOR=1]])

opt.completeopt = { "menu", "menuone", "noselect" }
opt.mouse = "a"
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.termguicolors = true
opt.modifiable = true
opt.backspace = { "indent", "eol", "start" }
opt.number = true
opt.syntax = "on"
opt.number = true
opt.errorbells = false
opt.completeopt = "menuone,noselect"
opt.cursorline = true

opt.autoindent = true
opt.cindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.hlsearch = true
opt.expandtab = true

opt.hidden = true
opt.backup = false
opt.wrap = false

opt.formatoptions = "l"
opt.scrolloff = 8

opt.encoding = "utf-8"
opt.cmdheight = 2
opt.updatetime = 40

opt.clipboard = "unnamedplus"
opt.splitright = true

opt.splitbelow = true
opt.swapfile = false
opt.showmode = false

opt.showcmd = true
opt.showmatch = true
opt.incsearch = true -- Shows the match while typing

opt.relativenumber = true
