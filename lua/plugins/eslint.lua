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
    local eslint = require("eslint")
    eslint.setup({
      bin = "eslint", -- Or use "eslint_d"
      code_actions = {
        enable = true,
        apply_on_save = {
          enable = true,
          types = { "directive", "problem", "suggestion", "layout" },
        },
      },
      diagnostics = {
        enable = true,
        run_on = "type",
      },
    })

    -- Optional keymaps
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
        vim.keymap.set("n", "<leader>ef", "<cmd>EslintFixAll<CR>", opts)
        vim.keymap.set("n", "<leader>er", "<cmd>EslintRestart<CR>", opts)
      end,
    })
  end,
}
