return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- or "tabs"
        diagnostics = "nvim_lsp",
        separator_style = { "▎", "▎" }, --or use slant
        show_buffer_close_icons = true,
        show_close_icon = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", {})
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", {})
    vim.keymap.set("n", "<leader>bd", ":Bdelete<CR>", {desc = "Close buffer"})
  end,
	enabled = true;
}

