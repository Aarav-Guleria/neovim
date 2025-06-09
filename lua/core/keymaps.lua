local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File Explorer Toggle
keymap("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

-- Terminal mode mappings
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffer navigation
keymap("n", "<S-l>", ":bnext<CR>", opts)      -- Next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts)  -- Prev buffer
keymap("n", "<leader>bd", ":bdelete<CR>", opts) -- Delete buffer

-- VISUAL MODE: Move selected line(s) up/down and reselect them
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- NORMAL MODE: Keep cursor centered when scrolling or searching
keymap("n", "J", "mzJ`z") -- join lines without moving the cursor far
keymap("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })
keymap("n", "n", "nzzzv") -- next search result stays centered
keymap("n", "N", "Nzzzv") -- previous search result stays centered

-- VISUAL MODE: Better indentation (stay in selection after indent)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- CLIPBOARD FIXES: Don’t lose paste buffer when pasting
--keymap("x", "<leader>p", [["_dP]]) -- paste without yanking deleted
--keymap("n", "p", '"0p', opts) -- paste from default register (if lost)
--keymap({ "n", "v" }, "<leader>d", [["_d]]) -- delete without yanking

-- easy exit from insert mode
keymap("i", "<C-c>", "<Esc>")

-- CLEAR HIGHLIGHTS (after searching)
keymap("n", "<C-c>", ":noh<CR>", { desc = "Clear search highlight", silent = true })

-- SMART REPLACE: Replace word under cursor everywhere in file
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

-- MAKE CURRENT FILE EXECUTABLE
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- Format with Prettier (or any formatting source in null-ls)
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

