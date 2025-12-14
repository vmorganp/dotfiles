return {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
                picker = {
                        hidden = true,
                },

                bigfile = { enabled = true },

                explorer = {
                        enabled = true,
                },

                quickfile = { enabled = true },

                zen = {
                        win = {
                                backdrop = {
                                        transparent = false,
                                },
                        },
                        toggles = {
                                dim = false,
                                line_number = false,
                                git_signs = false,
                                mini_diff_signs = false,
                                diagnostics = false,
                                inlay_hints = false,
                        },
                },
        },
}
