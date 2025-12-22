-- Variables
local opt = vim.opt

local options =  {
    cindent = true,
    cinoptions = "b1g0",
    clipboard = "unnamedplus",
    cmdheight = 0,
    equalalways = false,
    expandtab = true,
    -- foldclose = 'all',
    history = 100,
    ignorecase = true,
    exrc = true,
    linebreak = true,
    number = true,
    relativenumber = true,
    scrolloff = 999,
    showbreak = "---",
    spell = true,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    smartindent = true,
    title = true,
    undofile = true,
    -- wrap = true,
    virtualedit = "block",
    cinkeys = {"break"},
    completeopt = "menuone,noselect,popup",
    winborder = "rounded",
    mouse = "",
}
for k, v in pairs(options) do
    opt[k] = v
end

vim.g.chistory = 25
-- vim.o.ruler = false


-- vim.o.statusline = [[%<%f %h%m%r %y%=%{v:register} %-14.(%l,%c%V%) %P]]
