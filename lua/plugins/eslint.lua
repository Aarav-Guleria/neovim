return {
    {
        "MunifTanjim/eslint.nvim",
        ft = {
            "javascript", "javascriptreact",
            "typescript", "typescriptreact",
            "vue", "svelte"
        },
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            local eslint = require("eslint")
            eslint.setup({
                bin = "eslint", -- or "eslint_d" for faster linting
                code_actions = {
                    enable = true,
                    apply_on_save = {
                        enable = true,
                        types = { "directive", "problem", "suggestion" }, -- Removed "layout" to avoid conflicts
                    },
                    disable_line_comment = true,
                    disable_rule_file_comment = true,
                },
                diagnostics = {
                    enable = true,
                    report_unused_disable_directives = false,
                    run_on = "type", -- or "save"
                },
            })
            -- Additional keymaps for ESLint
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
                callback = function()
                    local opts = { noremap = true, silent = true, buffer = true }
                    vim.keymap.set("n", "<leader>ef", "<cmd>EslintFixAll<CR>",
                        vim.tbl_extend("force", opts, { desc = "ESLint fix all" }))
                    vim.keymap.set("n", "<leader>er", "<cmd>EslintRestart<CR>",
                        vim.tbl_extend("force", opts, { desc = "ESLint restart" }))
                    vim.keymap.set("n", "<leader>ei", "<cmd>EslintInfo<CR>",
                        vim.tbl_extend("force", opts, { desc = "ESLint info" }))
                end,
            })
        end,
    },
}
