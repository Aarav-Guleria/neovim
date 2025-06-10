return {
  "MunifTanjim/eslint.nvim",
  ft = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "svelte",
  },
  dependencies = {
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("eslint").setup({
      bin = "eslint",
      code_actions = {
        enable = false, -- disable auto fixing
        apply_on_save = { enable = false },
      },
      diagnostics = {
        enable = true,
        run_on = "type",
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
      },
      callback = function()
        local opts = { noremap = true, silent = true, buffer = true }
        vim.keymap.set("n", "<leader>er", "<cmd>EslintRestart<CR>", opts)
      end,
    })
  end,
}

