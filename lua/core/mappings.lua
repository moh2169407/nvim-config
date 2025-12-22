-- Key Maps
require("core.mappings.telescope-mappings")
require("core.mappings.toggleterm-mappings")

local set = vim.keymap.set

-- Inputs a semicolon at the end of the line
set({"i", "n"}, "<C-;>", function()
    local line = vim.api.nvim_get_current_line()
    line = line .. ";"
    vim.api.nvim_set_current_line(line)
end, {desc = "Inputs a semicolon at the end of the line"})

-- Allow to reload neovim without closing and open it up again
set("n","<leader>s", ":w | source<CR>", {desc = "Source Lua file"})

-- Closes a buffer
set({"n", "i"}, "<C-q>", "<Esc>:q<CR>", {desc = "Closes a buffer"})
set("t", "<C-q>", "<C-\\><C-n>:q<CR>", { desc = "Closes terminal buffer" })

-- Resizes windows
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", { desc = "Increases window length" })
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", { desc = "Decreases window length" })

vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Increases window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Decreases window width" })

-- -- Moving between Buffers
vim.keymap.set("n", "<Leader>n", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Leader>p", ":bp<CR>", { desc = "Previous buffer" })

vim.keymap.set("n", "<C-s>", ":w<CR>", {desc = "Write buffer"})

-- Global LSP keymaps
vim.keymap.set("n", "gtd", function ()
   vim.lsp.buf.definition()
end, {desc = "Goes to definition"})
