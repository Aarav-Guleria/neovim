return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Ensures that the Treesitter parsers are updated
  event = { "VeryLazy" }, -- Load when the editor is idle (lazy loading)

  config = function()
    require("nvim-treesitter.configs").setup({
      -- Specify which languages to install parsers for
      ensure_installed = {
        "lua", "javascript", "python", "java", "c",    -- Existing languages
        "html", "css", "tsx", "javascript", "json", "bash", "markdown", -- Additional languages
      },
      -- Enable syntax highlighting
      highlight = {
        enable = true,
      },

      -- Enable indentation features
      indent = {
        enable = true,
      },

      -- Configure incremental selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",      -- Start selection
          node_incremental = "grn",    -- Expand selection
          node_decremental = "grm",    -- Shrink selection
        },
      },
    })
  end,
}

