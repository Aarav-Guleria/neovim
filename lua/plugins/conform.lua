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
            mode = "",
            desc = "Format buffer",
        },
    },
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { { "prettierd", "prettier" } },
            typescript = { { "prettierd", "prettier" } },
            javascriptreact = { { "prettierd", "prettier" } },
            typescriptreact = { { "prettierd", "prettier" } },
            json = { { "prettierd", "prettier" } },
            html = { { "prettierd", "prettier" } },
            css = { { "prettierd", "prettier" } },
            scss = { { "prettierd", "prettier" } },
            yaml = { { "prettierd", "prettier" } },
            markdown = { { "prettierd", "prettier" } },
            go = { "goimports", "gofmt" },
            rust = { "rustfmt" },
            c = { "clang_format" },
            cpp = { "clang_format" },
            java = { "google-java-format" },
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters = {
            -- Customize formatters
            stylua = {
                prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
            },
            prettier = {
                prepend_args = { "--tab-width", "2" },
            },
        },
    },
    init = function()
        -- If you want to format on save, you can use this:
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
}
