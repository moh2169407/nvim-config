-- Configuring Tree Sitter 
require("nvim-treesitter.configs").setup({
    -- Ensures these parser are always installed
    ensure_installed = {
        "c", "java", "python", "scheme", "prolog", "asm",
        "markdown", "yaml", "vim", "lua"
    },
    -- Install Missing Parsers
    auto_install = true,
    -- Enables Tree sitter Highlighting
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- Indentation provided by tree sitter
    indent = {
        enable = true,
    },
    -- Incremental Selection based on the tree
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gns",
            node_incremental = "gni",
            node_decremental = "gnd",
            scope_incremental = "grc",
        }
    },
    -- Allows motions based on queries 
    textobjects = {
        select = {
            enable = true,
            -- allows for motions to be added to capture groups
            lookahead = true,
            -- Setting keymaps
            keymaps = {
                ["af"] = { query = "@function.outer", desc = "Selects inside and around the function"},
                ["if"] = { query = "@function.inner", desc = "Selects inside the function"},
                ["ai"] = { query = "@assignment.inner", desc = "Selects the name and everything to right of = "},
                ["ao"] = { query = "@assignment.outer", desc = "Selects the entire assignment"},
                ["rh"] = { query = "@assignment.rhs", desc = "Selects the right hand side of the assignment"},
                ["lh"] = { query = "@assignment.lhs", desc = "Selects the left hand side of the assignment"},
                ["cm"] = { query = "@comment.outer", desc = "Selects a comment"},
                ["ci"] = { query = "@class.inner", desc = "Select the inside the class"},
                ["ca"] = { query = "@class.outer", desc = "Selects the inside and around the class"},
                }
        },
        include_surrounding_whitespace = true,
        -- Allows moving and jump to text object 
        move = {
            enable = true,
            goto_next_start = {
                ["]m"] = { query = {"@function.outer", "@class.outer"}, desc = "Go to next function/class start"},
            },
            goto_previous_start = {
                ["[m"] = { query = {"@function.outer", "@class.outer"}, desc = "Go to previous function/class start"},
            },
            goto_next_end = {
                ["]M"] = { query = {"@function.outer", "@class.outer"}, desc = "Go to next function/class end"},
            },
            goto_previous_end = {
                ["[M"] = { query = {"@function.outer", "@class.outer"}, desc = "Go to previous function/class end"},
            },
            -- TODO
            -- Going to add a capture group for the beginning of a function and end, for ease of jumps
        },
    }
})



