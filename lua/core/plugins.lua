-- lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not pcall(vim.loop.fs_stat, lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins from plugins/ directory
require("lazy").setup("plugins")

-- Plugin imports
return {
    -- neodev
    { import = "neodev" },

    -- Core utilities
    { import = "plugins.plenary" },

    -- LSP + Linters + Formatters
    { import = "plugins.lsp" },
    { import = "plugins.mason" },
    { import = "plugins.none-ls" },
    { import = "plugins.eslint" },

    -- Autocompletion & Snippets
    { import = "plugins.cmp" },
    { import = "plugins.luasnip" },

    -- UI/UX Enhancements
    { import = "plugins.lualine" },
    { import = "plugins.bufferline" },
    { import = "plugins.indent-blankline" },
    { import = "plugins.neoscroll" },
    { import = "plugins.autopairs" },

    -- Syntax highlighting
    { import = "plugins.treesitter" },

    -- Conform
    { import = "plugins.conform" },

    -- Debugger (DAP)
    { import = "plugins.dap" },

    -- Java LSP
    { import = "plugins.jdtls" },

    -- Typescript support
    { import = "plugins.typescript" },

    -- HTML, CSS abbreviations
    { import = "plugins.emmet" },

    -- React snippets
    { import = "plugins.snippets-react" },

    -- Git integrations
    { import = "plugins.git" },

    -- UI Customizations
    { import = "plugins.ui" },

    -- Auto tag closing
    { import = "plugins.autotags" },

    -- Home page
    { import = "plugins.alpha" },

    -- Harpoon
    { import = "plugins.hapoon" },

    -- Undotree
    { import = "plugins.undotree" },

    -- Trouble
    { import = "trouble.lua" },

    -- ToDo
    { import = "todo-comments.lua" },

    -- Test
    { import = "nvim-test.lua" },

    -- Mini
    { import = "mini.lua" },

    -- Copilot
    { import = "copilot" },

    -- Which key
    { import = "which-key" },

}
