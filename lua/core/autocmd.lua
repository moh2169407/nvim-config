vim.api.nvim_create_autocmd({"InsertLeave", "BufWritePre"}, {
    pattern = "*.scm",
    callback = function()
        vim.lsp.buf.format({async = true})
    end
})
