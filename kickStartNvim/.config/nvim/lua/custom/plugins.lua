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

    use {
        "startup-nvim/startup.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
        config = function()
            require"startup".setup()
        end
    }

    -- require'lspconfig'.terraformls.setup{}
    -- vim.api.nvim_create_autocmd({"BufWritePre"}, {
    --     pattern = {"*.tf", "*.tfvars"},
    --     callback = vim.lsp.buf.format(),
    -- })
end

