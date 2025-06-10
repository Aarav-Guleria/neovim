return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format with Conform",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      html = { "biome" },
      css = { "biome" },
      scss = { "biome" },
      markdown = { "prettier" },
      yaml = { "prettier" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      java = { "google_java_format" },
    },
    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      local skip = {
        javascript = true,
        typescript = true,
        javascriptreact = true,
        typescriptreact = true,
        html = true,
        json = true,
        css = true,
        scss = true,
      }
      if skip[ft] then
        return nil
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      },
      prettier = {
        prepend_args = { "--tab-width", "2" },
      },
      google_java_format = {},
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
  end,
}
