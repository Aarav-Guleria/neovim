local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  callback = function()
    vim.cmd("let @/ = ''")
  end,
})

