vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugin Manager
require("core.plugins")

require("core.options")
require("core.keymaps")
require("core.autocommands")
require("core.clipboard")

-- LSP setup
require("plugins.lsp")
require("plugins.cmp")

-- using 24 bit color
vim.opt.termguicolors = true
