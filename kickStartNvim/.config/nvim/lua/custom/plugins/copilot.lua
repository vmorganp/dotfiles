return {
    "github/copilot.vim",
    config = function()
        vim.cmd[[:Copilot disable]]
        vim.g.copilot_no_tab_map = true
        vim.api.nvim_set_keymap("i", "<C-g>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end
}
