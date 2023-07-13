return {
    "akinsho/toggleterm.nvim",
    keys = {
        { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "toggleterm" },
    },
    config = function()
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
        require"toggleterm".setup({
            direction="float"
        })
    end,
}