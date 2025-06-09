return {
    "jose-elias-alvarez/nvim-lsp-ts-utils",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("nvim-lsp-ts-utils").setup({
            disable_commands = false,
            enable_import_on_completion = true,
        })
    end,
}

