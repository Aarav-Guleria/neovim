return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",  -- use the latest Harpoon v2
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- setup with default options
    harpoon:setup()

    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Mark current file
    keymap("n", "<leader>ha", function() harpoon:list():add() end, vim.tbl_extend("force", opts, { desc = "Harpoon: Add file" }))

    -- Toggle quick menu
    keymap("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, vim.tbl_extend("force", opts, { desc = "Harpoon: Toggle quick menu" }))

    -- Navigate to files
    keymap("n", "<leader>1", function() harpoon:list():select(1) end, vim.tbl_extend("force", opts, { desc = "Harpoon: Go to file 1" }))
    keymap("n", "<leader>2", function() harpoon:list():select(2) end, vim.tbl_extend("force", opts, { desc = "Harpoon: Go to file 2" }))
    keymap("n", "<leader>3", function() harpoon:list():select(3) end, vim.tbl_extend("force", opts, { desc = "Harpoon: Go to file 3" }))
    keymap("n", "<leader>4", function() harpoon:list():select(4) end, vim.tbl_extend("force", opts, { desc = "Harpoon: Go to file 4" }))
  end,
}

