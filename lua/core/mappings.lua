-- Key Maps

require("core.mappings.telescope-mappings")



local set = vim.keymap.set

-- Inputs a semicolon at the end of the line
set({"i", "n"}, "<C-;>", function()
    local line = vim.api.nvim_get_current_line()
    line = line .. ";"
    vim.api.nvim_set_current_line(line)
end, {desc = "Inputs a semicolon at the end of the line"})

set("n","<leader>s", ":w | source<CR>", {desc = "Source Lua file"})



-- Resizes windows
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", { desc = "Increases window length" })
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", { desc = "Decreases window length" })

vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Increases window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Decreases window width" })
-- -- Turns off spell check
-- --vim.keymap.set("n", "<S-N>", ":lua vim.opt.spell = false<CR>");
-- -- Moving between Buffers
vim.keymap.set("n", "<Leader>n", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Leader>p", ":bp<CR>", { desc = "Previous buffer" })
-- -- Closing a buffer
-- vim.keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "Close current buffer" })
--
