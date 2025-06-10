return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer with Conform",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      html = { "biome" },
      css = { "biome" },
      scss = { "biome" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      go = { "goimports", "gofmt" },
      rust = { "rustfmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      java = { "google_java_format" },
    },

    -- only format on save for filetypes not listed
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
  end,
}
