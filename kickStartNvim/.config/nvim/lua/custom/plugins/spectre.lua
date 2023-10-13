return {
    'nvim-pack/nvim-spectre',
    keys = {
        { "<leader>rr", function() require("spectre").toggle() end, desc = "harpoon add file" },
    }
}
