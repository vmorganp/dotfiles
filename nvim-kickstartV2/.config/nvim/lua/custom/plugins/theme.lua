-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {},
--   config = function()
--     require("tokyonight").setup({
--       on_colors = function(colors)
--         colors.bg            = "#000000"
--         colors.bg_dark       = "#000000"
--         colors.bg_sidebar    = "#000000"
--         colors.bg_statusline = "#000000"
--       end
--     })
--     vim.cmd [[colorscheme tokyonight-night]]
--   end
-- }
--

return {
	"Shatur/neovim-ayu",
	lazy = false,
	config = function()
		require("ayu").setup({
			overrides = {
				Normal = { bg = "#000000" },
				NormalFloat = { bg = "#000000" },
				ColorColumn = { bg = "#000000" },
				SignColumn = { bg = "#000000" },
				Folded = { bg = "#000000" },
				FoldColumn = { bg = "#000000" },
				CursorColumn = { bg = "#000000" },
				VertSplit = { bg = "#000000" },
			},
		})
		vim.cmd([[colorscheme ayu-dark]])
	end,
}
