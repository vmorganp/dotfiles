return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- diagnostics
				-- null_ls.builtins.diagnostics.actionlint,
				null_ls.builtins.diagnostics.codespell,
				null_ls.builtins.diagnostics.terraform_validate,
				null_ls.builtins.diagnostics.cfn_lint,

				-- formatting
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.terraform_fmt,
				null_ls.builtins.formatting.nixfmt,

				-- completion
				null_ls.builtins.completion.spell,
			},
		})
	end,
}
