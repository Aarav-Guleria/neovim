return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "jay-babu/mason-null-ls.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.formatting.prettier.with({
            filetypes = {
              "javascript", "typescript", "css", "json",
              "html", "markdown", "yaml"
            },
          }),
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = { "eslint_d", "prettier" },
        automatic_installation = true,
      })

      -- Optional: format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.js", "*.ts", "*.json", "*.css", "*.html", "*.yaml", "*.md" },
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Optional: manual format keymap
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, { desc = "Format file" })
    end,
  },
}

