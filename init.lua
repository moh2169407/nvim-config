-- Inits the map leader early
vim.g.mapleader = " "
require("plugins.init")

require("core.mappings")
require("core.options")
require('core.autocmd')
require('core.lsp')

-- Abbreviate Commonly Mistype Commands
vim.cmd([[ab Q! q!]])



