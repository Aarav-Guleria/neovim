return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "folke/neodev.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/mason-lspconfig.nvim",
            "b0o/schemastore.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local capabilities = cmp_nvim_lsp.default_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true

            local on_attach = function(client, bufnr)
                local opts = { noremap = true, silent = true, buffer = bufnr }
                local keymap = vim.keymap.set

                if client.name == "ts_ls" then
                    client.server_capabilities.documentFormattingProvider = false
                end

                -- Navigation keymaps
                keymap("n", "gd", "<cmd>Telescope lsp_definitions<CR>",
                    vim.tbl_extend("force", opts, { desc = "Go to definition" }))
                keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
                keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>",
                    vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
                keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>",
                    vim.tbl_extend("force", opts, { desc = "Go to type definition" }))
                keymap("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>",
                    vim.tbl_extend("force", opts, { desc = "Show references" }))

                -- Documentation keymaps
                keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Show hover documentation" }))
                keymap("n", "<leader>sh", vim.lsp.buf.signature_help,
                    vim.tbl_extend("force", opts, { desc = "Show signature help" }))

                -- Diagnostic keymaps
                keymap("n", "<leader>d", vim.diagnostic.open_float,
                    vim.tbl_extend("force", opts, { desc = "Show line diagnostics" }))

                keymap("n", "[d", vim.diagnostic.goto_prev,
                    vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))

                keymap("n", "]d", vim.diagnostic.goto_next,
                    vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

                keymap("n", "<leader>q", vim.diagnostic.setloclist,
                    vim.tbl_extend("force", opts, { desc = "Diagnostics to location list" }))

                -- Workspace keymaps
                keymap("n", "<leader>ca", vim.lsp.buf.code_action,
                    vim.tbl_extend("force", opts, { desc = "Code actions" }))
                keymap("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
                keymap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
                    vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
                keymap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
                    vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
                keymap("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, vim.tbl_extend("force", opts, { desc = "List workspace folders" }))

                -- Inlay hints toggle (if supported)
                if client.supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    keymap("n", "<leader>ih", function()
                        local current_setting = vim.lsp.inlay_hint.is_enabled(bufnr)
                        vim.lsp.inlay_hint.enable(not current_setting, { bufnr = bufnr })
                    end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))
                end
            end

            -- Diagnostic configuration
            vim.diagnostic.config({
                virtual_text = {
                    enabled = true,
                    source = "if_many",
                    prefix = "●",
                },
                signs = true,
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim", "require" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                            completion = { callSnippet = "Replace" },
                        },
                    },
                },
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                            },
                        },
                    },
                },
                ts_ls = {
                    init_options = {
                        preferences = { disableSuggestions = true },
                    },
                    settings = {
                        javascript = {
                            format = { enable = false },
                            suggest = { autoImports = true },
                        },
                        typescript = {
                            format = { enable = false },
                            suggest = { autoImports = true },
                        },
                    },
                },
                clangd = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--function-arg-placeholders",
                        "--fallback-style=llvm",
                    },
                    init_options = {
                        usePlaceholders = true,
                    },
                },
                html = {
                    filetypes = { "html", "templ" },
                },
                cssls = {
                    settings = {
                        css = { validate = true, lint = { unknownAtRules = "ignore" } },
                        scss = { validate = true, lint = { unknownAtRules = "ignore" } },
                        less = { validate = true, lint = { unknownAtRules = "ignore" } },
                    },
                },
                jsonls = {
                    settings = {
                        json = {
                            schemas = require("schemastore").json.schemas(),
                            validate = { enable = true },
                        },
                    },
                },
                emmet_ls = {
                    filetypes = {
                        "html", "css", "scss", "sass", "less",
                        "javascript", "javascriptreact",
                        "typescript", "typescriptreact", "vue", "svelte"
                    },
                    init_options = {
                        html = {
                            options = {
                                ["bem.enabled"] = true,
                                ["output.selfClosingStyle"] = "html",
                            },
                        },
                    },
                },
            }

            -- Setup servers with error handling
            for server_name, config in pairs(servers) do
                -- Check if server exists before trying to set it up
                if not lspconfig[server_name] then
                    vim.notify("LSP server not available: " .. server_name, vim.log.levels.WARN)
                    goto continue
                end

                local server_config = vim.tbl_deep_extend("force", {
                    on_attach = on_attach,
                    capabilities = capabilities,
                }, config)

                local ok, err = pcall(lspconfig[server_name].setup, server_config)
                if not ok then
                    vim.notify("Failed to setup LSP server " .. server_name .. ": " .. tostring(err),
                        vim.log.levels.ERROR)
                end

                ::continue::
            end

            -- Auto-format on save for specific filetypes
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = vim.api.nvim_create_augroup("LspFormatting", {}),
                pattern = { "*.lua" }, -- Only format Lua files with LSP, others use conform.nvim
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end,
    },
    {
        "b0o/schemastore.nvim",
        lazy = true,
    },
}
