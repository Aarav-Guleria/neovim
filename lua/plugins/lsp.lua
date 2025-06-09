return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local mason_lspconfig = require("mason-lspconfig")

            local on_attach = function(_, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local keymap = vim.keymap.set

                -- Navigation
                keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
                keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
                keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                -- Hover / Signature
                keymap("n", "K", vim.lsp.buf.hover, opts)
                keymap("n", "<C-k>", vim.lsp.buf.signature_help, opts)

                -- Code actions & rename
                keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)

                -- Diagnostics
                keymap("n", "<leader>ld", vim.diagnostic.open_float, opts)
                keymap("n", "[d", vim.diagnostic.goto_prev, opts)
                keymap("n", "]d", vim.diagnostic.goto_next, opts)
            end

            -- Setup Mason and ensure servers are installed
            require("mason").setup()
            mason_lspconfig.setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "clangd",
                    "jdtls",
                    "emmet_ls",
                },
            })

            -- Mason handlers for LSP setup
            mason_lspconfig.setup_handlers({
                function(server)
                    lspconfig[server].setup({
                        on_attach = on_attach,
                    })
                end,

                -- Lua config
                ["lua_ls"] = function()
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
                                telemetry = { enable = false },
                            },
                        },
                    })
                end,

                -- Emmet config
                ["emmet_ls"] = function()
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
            })
        end,
    },
}

