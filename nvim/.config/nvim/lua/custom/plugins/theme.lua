return {
	"Shatur/neovim-ayu",
	name = "ayu",
	priority = 1000,
	config = function()
		require("ayu").setup({
			overrides = {
				Normal = { bg = "#000000" },
				NormalNC = { bg = "#000000" },
				NormalFloat = { bg = "#000000" },
			},
		})
		vim.cmd([[colorscheme ayu-dark]])
	end,
}
