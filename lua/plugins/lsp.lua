return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")

            -- Shared on_attach function for keymaps and other per-buffer setup
            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local keymap = vim.keymap.set

                -- LSP-related keymaps
                keymap("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)
                keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                keymap("n", "K", vim.lsp.buf.hover, opts)
                keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            end

            -- Lua
            lspconfig.lua_ls.setup({
                on_attach = on_attach,
                settings = {
                    Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })

            -- Python
            lspconfig.pyright.setup({ on_attach = on_attach })

            -- JavaScript / TypeScript
            lspconfig.ts_ls.setup({
                on_attach = on_attach,
                settings = {
                    javascript = { format = { enable = true } },
                    typescript = { format = { enable = true } },
                },
            })

            -- C/C++
            lspconfig.clangd.setup({ on_attach = on_attach })

            -- Java
            lspconfig.jdtls.setup({ on_attach = on_attach })

            -- Emmet LSP
            lspconfig.emmet_ls.setup({
                on_attach = on_attach,
                filetypes = {
                    "html",
                    "css",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })
        end,
    },
}

