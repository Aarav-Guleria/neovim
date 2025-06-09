return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        variant = "dark",
        transparent = false,
	colors = {
          bg = "#0d1117",  -- Gives a soft dark background, looks translucent in acrylic mode
             },

        saturation = 1,
        italic_comments = true,
        hide_fillchars = false,
        borderless_pickers = true,
        terminal_colors = true,
        cache = false,
        extensions = {
          telescope = true,
          notify = true,
          mini = true,
          -- neo-tree is not officially supported yet
        },
      })

      --vim.cmd.colorscheme("cyberdream")
    end,
  },
}

