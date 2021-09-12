local opt = vim.opt

opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + {"*.o", "*~", "*.pyc", "*pycache*"}

opt.termguicolors = true
opt.modifiable = true

opt.backspace = {"indent", "eol", "start"}
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
opt.wrap = true

opt.formatoptions = "l"
opt.scrolloff = 8

opt.encoding = "utf-8"
opt.cmdheight = 2
opt.updatetime = 300

opt.clipboard = "unnamedplus"
opt.splitright = true

opt.splitbelow = true
opt.swapfile = false
opt.showmode = false

opt.showcmd = true
opt.showmatch = true
opt.incsearch = true -- Shows the match while typing
