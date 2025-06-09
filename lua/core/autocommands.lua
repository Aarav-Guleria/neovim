-- autoformatting 
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.js", "*.ts", "*.tsx", "*.css", "*.html", "*.json" },
    callback = function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 1000,
        })
    end,
})

--autoformatting for java, c
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.java", "*.c", "*.h" },
    callback = function()
        vim.lsp.buf.format({
            async = false,
            timeout_ms = 1000,
        })
    end,
})

--Clearing search pattern on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("let @/ = ''")
  end,
})

