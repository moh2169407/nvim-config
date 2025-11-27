-- Key Maps
-- Telescope Mapping
local builtin = require("telescope.builtin")
local set = vim.keymap.set
-- Finding Stuff 
set("n", "<leader>ff", builtin.find_files, { desc = 'Telescope find files'})
set("n", "<leader>fg", builtin.live_grep, { desc = 'Telescope find files'})
set("n", "<leader>fs", builtin.grep_string, {desc = "Telescope find string"})
-- Opening Stuff
set("n", "<leader>ob", builtin.buffers, {desc = 'Telescope opens buffers'})
set("n", "<leader>of", builtin.oldfiles, {desc = 'Telescope open old files'})
set("n", "<leader>ot", builtin.tags, {desc = 'Telescope open tags'})
set("n", "<leader>om", builtin.marks, {desc = 'Telescope open marks'})
set("n", "<leader>oq", builtin.quickfix, {desc = 'Telescope open quickfix'})
-- LSP Pickers keymaps -- TODO once I have lsp set up
set("n", "<leader>l", builtin.marks, {desc = 'Telescope open quickfix'})

--Git Telescope 
set("n", "<leader>gc", builtin.git_commits, {desc = 'Telescope opens buffers'})
set("n", "<leader>gd", builtin.oldfiles, {desc = 'Telescope open old files'})
set("n", "<leader>ot", builtin.tags, {desc = 'Telescope open tags'})
set("n", "<leader>om", builtin.marks, {desc = 'Telescope open marks'})
set("n", "<leader>gb", builtin.marks, {desc = 'Telescope open marks'})

set("n", "<leader>fb", function()
    require("telescope").extensions.file_browser.file_browser() end, {desc = "Telescope File Browser"})

