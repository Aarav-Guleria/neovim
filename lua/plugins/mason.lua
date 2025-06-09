return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "html",
                    "cssls",
                    "jsonls",
                    "clangd",
                    "jdtls",
                    "emmet_ls",
                    --"eslint", check eslint.lua
                },
                automatic_installation = true,
            })
        end,
    },
}
