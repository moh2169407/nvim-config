-- Local Variables
local actions = require("telescope.actions")

-- Configuring Telescope Settings
require("telescope").setup{
    -- Setting Default Telescope Settings
    defaults = {
        -- Makes the pop-up takes the entire screen
        layout_config = { 
            horizontal =  { 
                height = {padding=0},
                width = {padding=0},
            },
        },
        -- Makes the window little transparent
        -- winblend = 10,
        -- Changes how the files are displayed
        path_display = {
            "filename_first",
        } ,

        -- Configures the mappings
        mappings = {
            -- Insert Mode
            i = {
                -- Removing the old binds
                ["<C-x>"] = false,
                ["<C-u>"] = false,
                ["<C-d>"] = false,
                ["<C-f>"] = false,
                ["<C-k>"] = false,

                -- Settings the new binds
                ["<C-s>"] = "select_horizontal",
                ["<C-k>"] = actions.preview_scrolling_up,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-h>"] = actions.preview_scrolling_left,
                ["<C-l>"] = actions.preview_scrolling_right,

            },
            -- Normal Mode
            n = {
                -- Removing the old binds
                ["<C-x>"] = false,
                ["<C-u>"] = false,
                ["<C-d>"] = false,
                ["<C-f>"] = false,
                ["<C-k>"] = false,


                -- Settings the new binds
                ["<C-s>"] = "select_horizontal",
                ["<C-k>"] = actions.preview_scrolling_up,
                ["<C-j>"] = actions.preview_scrolling_down,
                ["<C-h>"] = actions.preview_scrolling_left,
                ["<C-l>"] = actions.preview_scrolling_right,
            }
        },
        -- A list of Patterns that won't be displayed
        file_ignore_patterns = {
            "*.o",
            "DS_STORE",
            ".git",
            "build/*",
        }
    },
    -- Configurations for pickers
    pickers = {
        find_files = {
            -- Shows hidden files
            hidden = true,
        },
        live_grep = {
            hidden = true,
        }
    },
    -- TODO 
    -- Adjust the jump amount in telescope preview
    scroll_speed = 1,
    extension = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
        ['file_browser'] = {
            hijack_netrw = true,
        },
    },
}

-- Telescope Extensions
local load = require('telescope').load_extension

load('fzf') --Makes fuzzy finding faster
load ('ui-select')  -- Integrates Neovim UI element into Telescope
load("file_browser") -- A file browser
