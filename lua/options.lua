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
-- Disables Mouse
vim.opt.mouse = ""

-- Key Maps

-- Resizes windows
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", { desc = "Increases window length" })
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", { desc = "Decreases window length" })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", { desc = "Increases window width" })
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", { desc = "Decreases window width" })
-- Turns off spell check
--vim.keymap.set("n", "<S-N>", ":lua vim.opt.spell = false<CR>");
-- Moving between Buffers
vim.keymap.set("n", "<Leader>n", ":bn<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<Leader>p", ":bp<CR>", { desc = "Previous buffer" })
-- Closing a buffer
vim.keymap.set("n", "<Leader>q", ":bd<CR>", { desc = "Close current buffer" })

-- Diagnostics
-- Moves to next error
vim.keymap.set("n", "]e", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })
-- Moves to the previous error
vim.keymap.set("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous Error" })
-- Opens a Telescope window with all the error and warnings inside buffer
vim.keymap.set("n", "<Leader>sd", function()
    vim.diagnostic.open_float()
end, { desc = "Opesn the Diagnostic window" })
-- Toggles diagnostics
vim.keymap.set("n", "<Leader>H", function()
    if vim.diagnostic.is_enabled() then
        vim.diagnostic.enable(false)
    else
        vim.diagnostic.enable()
    end
end, { desc = "Toggle Diagnostics" })
-- configures general diagnostics settings
vim.diagnostic.config({
    -- virtual_text = true,
    virtual_lines = {
        severity = vim.diagnostic.severity.warnings
    },
    underline = true,
    severity_sort = true,
    float = true,
})

-- vim.keymap.set("n", "gtd",":Telescope lsp_definitions<CR>"
-- )
--
vim.keymap.set("n", "<Leader>r", function()
    require("runner").run()
end)
