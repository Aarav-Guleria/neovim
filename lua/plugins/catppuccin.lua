return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      background = {
        dark = "mocha",
      },
      -- color_overrides = {
      --     mocha = {
      --              base = "#0F0F17",    -- Darkest background
      --              mantle = "#13131A",  -- Slightly lighter (used in panels)
      --              crust = "#181825",   -- Lightest (used for borders, etc.)
      --    },
      -- },

      transparent_background = true,
      integrations = {
        treesitter = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        neotree = true,
        dap = true,
        mason = true,

        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
