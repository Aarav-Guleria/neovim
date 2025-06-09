return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
        require("nvim-treesitter.configs").setup({

            ensure_installed = {
                -- Core languages
                "lua", "vim", "vimdoc", "query",
                -- Web development
                "html", "css", "scss", "javascript", "typescript", "tsx",
                "json", "yaml", "toml",
                -- Systems programming
                "c", "cpp", "rust", "go", "zig",
                -- Other languages
                "python", "java", "bash", "markdown",
                -- Markup and config
                "dockerfile", "gitignore", "regex",
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- Enable syntax highlighting
            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                additional_vim_regex_highlighting = false,
            },

            -- Enable indentation features
            indent = {
                enable = true,
                -- Disable for these languages as they have issues
                disable = { "python", "yaml" },
            },

            -- Configure incremental selection
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",    -- Start selection
                    node_incremental = "grn",  -- Expand selection
                    node_decremental = "grm",  -- Shrink selection
                    scope_incremental = "grc", -- Expand to scope
                },
            },

            -- Text objects configuration
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                    },
                },
            },
        })

        -- Enable folding based on treesitter
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false -- Don't fold by default
    end,
}
