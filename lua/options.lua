-- Sets line & relative numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Sets copy & pasting to global clipboard
vim.opt.clipboard = "unnamedplus"
-- Sets long words that can't fit on a new line
vim.opt.linebreak = true
-- Sets spelling errors
vim.opt.spell = true
-- Sets default position for window when opening new files
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Sets tabs as spaces instead
vim.opt.expandtab = true
-- Configs tab options
vim.opt.softtabstop = 5
vim.opt.shiftwidth = 5
-- Sets the cursor in the middle
vim.opt.scrolloff = 999
-- Sets the leaders key
vim.g.mapleader = " "
vim.opt.wrap = false
vim.opt.virtualedit = "block"
vim.opt.termguicolors = true
