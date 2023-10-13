return {
    'nvim-pack/nvim-spectre',
    keys = {
        { "<leader>rr", function() require("spectre").toggle() end, desc = "vscodeish find and replace" },
    }
}
