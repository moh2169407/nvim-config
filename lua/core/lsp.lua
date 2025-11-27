vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("racket_langserver")

vim.lsp.config("*", {
    capabilities = require('blink.cmp').get_lsp_capabilities()
})

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = {
		severity = vim.diagnostic.severity.ERROR
	}
})



