return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>ha", function() harpoon:list():add() end, opts)
    map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
    map("n", "<leader>1", function() harpoon:list():select(1) end, opts)
    map("n", "<leader>2", function() harpoon:list():select(2) end, opts)
    map("n", "<leader>3", function() harpoon:list():select(3) end, opts)
    map("n", "<leader>4", function() harpoon:list():select(4) end, opts)
  end,
}

