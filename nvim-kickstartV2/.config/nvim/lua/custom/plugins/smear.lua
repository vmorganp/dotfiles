return {
        "sphamba/smear-cursor.nvim",
        lazy = false,
        priority = 1000,
        keys = {
                {
                        "<leader>TS",
                        function()
                                require("smear_cursor").toggle()
                        end,
                        desc = "toggle smear",
                },
        },
        config = function()
                require("smear_cursor").enabled = true
        end,
}
