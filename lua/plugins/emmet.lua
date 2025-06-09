vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file" })

return {
  {
    "neovim/nvim-lspconfig",
    ft = {
      "html", "css", "scss",
      "javascript", "javascriptreact",
      "typescript", "typescriptreact",
    },
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.emmet_ls.setup({
        filetypes = {
          "html", "css", "scss",
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
        },
        init_options = {
          html = {
            options = {
              ["bem.enabled"] = true, -- Optional: enable BEM style
            },
          },
        },
        handlers = {
          ["textDocument/completion"] = function()
            -- Do nothing, disable LSP completion to avoid duplication with cmp-emmet
            return {}
          end,
        },
      })
    end,
  },
}

