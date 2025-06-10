local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File Explorer Toggle
keymap("n", "<leader>e", ":Neotree toggle<CR>", opts)

-- Terminal mode ESC to normal
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Move selected lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Scroll/search with center
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Indent visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Exit insert mode quickly
keymap("i", "jk", "<ESC>", opts)

-- Clear search
keymap("n", "<leader>n", ":noh<CR>", opts)

-- Smart Replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], opts)

-- Make file executable
keymap("n", "<leader>x", ":!chmod +x %<CR>", opts)

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>q", ":qa<CR>", opts)

-- Clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]], opts)
keymap("n", "<leader>Y", [["+Y]], opts)
keymap({ "n", "v" }, "<leader>p", [["+p]], opts)

-- Delete without yanking
keymap({ "n", "v" }, "<leader>d", [["_d]], opts)

-- Format (uses Conform fallback)
keymap("n", "<leader>f", function()
  local ok, conform = pcall(require, "conform")
  if ok then
    conform.format({ async = true, lsp_fallback = true })
  else
    vim.lsp.buf.format({ async = true })
  end
end, { desc = "Format file", noremap = true, silent = true })
