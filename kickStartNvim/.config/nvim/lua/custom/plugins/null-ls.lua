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
                diagnostics.jsonlint,
                diagnostics.terraform_validate,
                diagnostics.mypy,
                formatting.black.with({
                    extra_args = { "--line-length=200" }
                }),
                formatting.eslint,
                formatting.jq,
                formatting.prettier.with({
                    filetypes =
                    {
                        "html",
                        "json",
                        "yaml",
                        "markdown"
                    }
                }),
                formatting.yamlfmt,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({
                        group = augroup,
                        buffer = bufnr,
                    })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        }
    end,
}
