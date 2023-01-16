return function(use)
    use({
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end
    })

    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- set termguicolors to enable highlight groups
            vim.opt.termguicolors = true
            require("nvim-tree").setup()
        end
    })

end

