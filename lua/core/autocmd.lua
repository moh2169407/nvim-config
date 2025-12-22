vim.api.nvim_create_autocmd({"InsertLeave", "BufWritePre"}, {
    pattern = "*.scm",
    callback = function()
        vim.lsp.buf.format({async = true})
        vim.o.modifiable = true
    end
})

vim.api.nvim_create_autocmd("TermEnter", {
    callback = function()
        vim.opt.spell = false
    end,
})

vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
        vim.opt.spell = true
    end,
})


