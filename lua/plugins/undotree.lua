return {
  "mbbill/undotree",
  config = function()
    -- Optional: Map a key to toggle the UndoTree window
    vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeToggle<CR>", { noremap = true, silent = true })
  end,
}

