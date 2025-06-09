-- Fuzzy Finder (Telescope):

return {
    -- Main Telescope Plugin
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            -- Keybindings
            vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })      -- Ctrl + P
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" }) -- Space + ff
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })   -- Space + fg
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })  -- Space + fb
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })   -- Space + fh

            -- Telescope setup
            telescope.setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git" },
                },
            })
        end,
    },

    -- FZF Native extension for Telescope (Faster search)
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
    },
}
