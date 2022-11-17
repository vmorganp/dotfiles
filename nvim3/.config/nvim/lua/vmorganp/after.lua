vim.cmd('colorscheme gruvbox')
require("nvim-tree").setup()
vim.g.nvim_tree_respect_buf_cwd = 1

local telescope = require('telescope')
telescope.setup {
    defaults = {
        file_ignore_patterns = { ".git", "node_modules"}
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

