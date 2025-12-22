-- Downloading the Plugins
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/rose-pine/neovim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/m4xshen/autoclose.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    "https://github.com/folke/lazydev.nvim",
    "https://github.com/saghen/blink.cmp",
    "https://github.com/akinsho/toggleterm.nvim",
    "https://github.com/metalelf0/black-metal-theme-neovim",
})

-- Loads the configurations 
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.blink")
require("plugins.toggleterm")

-- Settings the colorscheme 
vim.cmd.colorscheme "rose-pine"

require('lazydev').setup({})
require("autoclose").setup({
	-- Scheme uses one ' for symbols
	keys = {
		["'"] = {disable_filetypes = {"scheme"}}
	}

})

