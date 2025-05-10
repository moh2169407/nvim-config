-- Bootstrap lazy.nvim
local path = vim.loop.cwd()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
     -- A color scheme
     {"rebelot/kanagawa.nvim", config = function()
            vim.cmd([[colorscheme kanagawa-dragon]])
        end},
     -- A status line plugin
     {"nvim-lualine/lualine.nvim",
          opts = {                      -- options to pass to the plugin
               options = {                -- specific settings for lualine
                    theme = "kanagawa"     -- setting the theme for lualine
               }
          }
     },
     -- A auto-complete brackets plugins
     {"windwp/nvim-autopairs",
     event = "InsertEnter",
     config = true
     },
     -- Treesitter
     {"nvim-treesitter/nvim-treesitter",
        dependencies = {"nvim-treesitter/nvim-treesitter-textobjects"},
        config = function()
            require ('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                sync_install = false,
                -- Automatically install missing parsers when entering buffer
                auto_install = true,
                highlight = {
                    enable = true,
                    -- Disables syntax if the file is too long
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gns", -- go new selections 
                        node_incremental = "gni", -- go next increment 
                        scope_incremental = "grc",
                        node_decremental = "gnd", -- go next decrement
                    },
                },
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            -- You can optionally set descriptions to the mappings (used in the desc parameter of
                            -- nvim_buf_set_keymap) which plugins like which-key display
                            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                            -- You can also use captures from other query groups like `locals.scm`
                            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                        },
                        -- You can choose the select mode (default is charwise 'v')
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * method: eg 'v' or 'o'
                        -- and should return the mode ('v', 'V', or '<c-v>') or a table
                        -- mapping query_strings to modes.
                        selection_modes = {
                            ['@parameter.outer'] = 'v', -- charwise
                            ['@function.outer'] = 'V', -- linewise
                            ['@class.outer'] = '<c-v>', -- blockwise
                        },
                        -- If you set this to `true` (default is `false`) then any textobject is
                        -- extended to include preceding or succeeding whitespace. Succeeding
                        -- whitespace has priority in order to act similarly to eg the built-in
                        -- `ap`.
                        --
                        -- Can also be a function which gets passed a table with the keys
                        -- * query_string: eg '@function.inner'
                        -- * selection_mode: eg 'v'
                        -- and should return true or false
                        include_surrounding_whitespace = true,
                    },
                },
            }
        end},
    -- Telescope
    {"nvim-telescope/telescope.nvim",
        dependencies = {"BurntSushi/ripgrep", "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').load_extension('fzf')
            require('telescope').load_extension("file_browser")
            -- Keymaps for telescope
            vim.keymap.set("n", "<Leader>ff",":cd" .. path .. "<CR>" .. ":Telescope find_files<CR>", {desc = "Telescope find files in cwd" })
            vim.keymap.set("n", "<Leader>fd", ":cd ~/Downloads<CR> :Telescope find_files<CR>", {desc = "Telescope find files in Downloads"})
            vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", {desc = "Telescope find grep in cwd"})
            vim.keymap.set("n", "<Leader>b", ":Telescope buffers<CR>", {desc = "Telescope find buffers"})
            vim.keymap.set("n", "<Leader>fb", ":Telescope file_browser<CR>", {desc = "Telescope file browser"})
            require("telescope").setup({
                -- Makes the window transparent
                pickers = {
                    find_files = {
                        hidden = true,  -- show hidden files like .gitignore
                    },
                    live_grep = {
                        additional_args = { "--hidden" },  -- grep through hidden files too
                    },
                    buffers = {
                        sort_lastused = true,
                        ignore_current_buffer = true,
                        mapping = {
                            i = {["<C-d>"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top }
                        }
                    },
                },
                defaults = {
                    mappings = {
                        i = {["<esc>"] = require("telescope.actions").close}
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    file_browser = {
                        hikack_netrw = true,
                    }
                },
            })
        end
    },
    -- A C library to make finding files quicker
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    -- A file explorer built for telescope
    {"nvim-telescope/telescope-file-browser.nvim"},
    -- Git Integration
    {"lewis6991/gitsigns.nvim"},
    -- A plugin for delimiter, brackets, braces, strings etc
    {"kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({})
        end},
    -- Global installing the servers
    {"neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                         diagnostics = { globals = { 'vim' } },  -- stop complaining about global vim
                    }
                }})
            lspconfig.pyright.setup({})
            lspconfig.jdtls.setup({})
        end
    },

-- A list of commented out plugins 
-- Color schemes
--[[  "bluz71/vim-moonfly-colors",
     {"folke/tokyonight.nvim"},
     {"Abstract-IDE/Abstract-cs"},
     "nyoom-engineering/oxocarbon.nvim",
--]]
})

