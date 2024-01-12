return {
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
    "nvimtools/none-ls.nvim",
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics
        -- local code_actions = null_ls.builtins.code_actions
        -- local completion = null_ls.builtins.completion
        return {
            sources = {
                diagnostics.actionlint,
                formatting.prettier,
            },
        }
    end,
}
