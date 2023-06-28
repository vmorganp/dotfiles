return {
    "b0o/schemastore.nvim",
    config = function()
        require('lspconfig').jsonls.setup {
            settings = {
                json = {
                    schemas = require('schemastore').json.schemas(),
                    validate = { enable = true },
                },
            },
        }
        require('lspconfig').yamlls.setup {
            settings = {
                yaml = {
                    schemaStore = {
                        -- You must disable built-in schemaStore support if you want to use
                        -- this plugin and its advanced options like `ignore`.
                        enable = false,
                    },
                    schemas = require('schemastore').yaml.schemas(),
                },
            },
        }
    end
}
