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
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- Sets the cursor in the middle
vim.opt.scrolloff = 999
-- Sets the leaders key
vim.g.mapleader = " "
vim.opt.wrap = false
vim.opt.virtualedit = "block"
vim.opt.termguicolors = true


-- Key Maps
-- Resizes windows
 vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", {desc = "Increases window length"})
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", {desc = "Decreases window length"})
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", {desc = "Increases window width"})
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", {desc = "Decreases window width"})
-- Turns off spell check
vim.keymap.set("n", "<S-N>", ":lua vim.opt.spell = false<CR>");
-- Moving between Buffers
vim.keymap.set("n", "<Leader>n", ":bn<CR>", {desc = "Next buffer"})
vim.keymap.set("n", "<Leader>p", ":bp<CR>", {desc = "Previous buffer"})
-- Closing a buffer
vim.keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "Close current buffer"})
