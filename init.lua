-- Ensure 'vim' global is defined
vim = vim or {}

-- Set leader key
vim.g.mapleader = " "

-- Plugin Manager
require("core.plugins")  -- Loads Lazy.nvim plugins

-- Require separate config files
require("core.options")        -- Neovim options
require("core.keymaps")        -- Keybindings
require("core.autocommands")   -- Auto commands
require("core.clipboard")      -- Clipboard settings

-- LSP setup
require("plugins.lsp")  -- LSP configuration
require("plugins.cmp")  -- Autocompletion configuration

-- using 24 bit color
vim.opt.termguicolors = true
