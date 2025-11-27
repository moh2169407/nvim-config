-- Configuring Blink Completions
require("blink-cmp").setup({
    -- Define keymaps to be used while completion window is open
    keymap = {
        -- Like VSCODE, enter to complete
        preset = "super-tab",
        -- Selects the first 1-6 completion options
        ['<C-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
        ['<C-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
        ['<C-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
        ['<C-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
        ['<C-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
        ['<C-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
    },
    completion = {
        -- Allows for a preview of text in completion before inserting it
        ghost_text = {
            enabled = true,
        },
        list = {
            selection = {
                -- preselect = false,
                -- Requires you to manual enter for the completion to work
                auto_insert = false
            }
        },
        menu = {
            -- auto_show_delay_ms = 500,
            -- auto_show = false
        },
        keyword = {
            range = "prefix"
        }
    },
    -- Terminal Completion Config
    -- term = {
    --     -- enabled = true,
    -- },
    -- Shows signature while typing,
    -- Prefer if i did manually, doesn't clutter the screen
    -- signature = { enabled = true }
})




