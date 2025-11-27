local terminal = require("toggleterm.terminal")
local ui = require("toggleterm.ui")
local set = vim.keymap.set

-- Going to normal mode in terminal
set("t", "<Esc>" ,[[<C-\><C-n>]], {desc = "Going to normal mode in terminal"} )

set("n", "<leader>tt", function ()
    local win_num = vim.fn.win_getid()
    local found = false
    -- Checks to see if there is an open terminal window and gets a list of all terminal windows
    local  is_open_term_win, open_windows = ui.find_open_windows()
    -- Checks to see if there is an open terminal window
    if is_open_term_win then
        -- Iterates through the list of window open
        for _, value in pairs(open_windows) do
            -- Checks to see if the current window is a terminal
            if win_num == value.window then
                -- toggles/hiding it
                terminal.get(value.term_id):close()
                found = true
            end
        end
        -- if the current window is not terminal, hide all terminal windows
        if not found then
           for _, value in pairs(open_windows) do
                terminal.get(value.term_id):close()
            end
        end
    else
        vim.cmd.ToggleTerm()
    end
end )


set("n", "<leader>tf", "<Esc>:ToggleTerm direction=float<CR>")
set("n", "<leader>tv", function ()
    local size = vim.api.nvim_win_get_width(0)
    local new_size = 0.40 * size
    vim.cmd.ToggleTerm(":ToggleTerm size=" .. new_size .. "direction=vertical<CR>")
end)
set("n", "<leader>ts", "<Esc>:ToggleTerm size=10 direction=horizontal<CR>")

