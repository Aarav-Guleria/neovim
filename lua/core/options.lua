local opt = vim.opt

opt.number = true              -- Enable line numbers
opt.relativenumber = true      -- Enable relative line numbers
opt.termguicolors = true -- Ensure true color support

opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true
opt.cursorline = true

opt.undofile = true
opt.ignorecase = true
opt.smartcase = true

opt.splitright = true
opt.splitbelow = true
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = "yes"

opt.backspace = {"start", "eol", "indent"}





--color theme
--vim.cmd("hi Normal guibg=#181825 ctermbg=NONE")   -- Keep a dark background
--vim.cmd("hi NormalNC guibg=#13131A ctermbg=NONE") -- Slightly darker for inactive windows
--vim.cmd("hi EndOfBuffer guibg=#181825 ctermbg=NONE") -- Prevent full transparency

