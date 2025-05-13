return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.comment").setup()
		require("mini.notify").setup()
		require("mini.files").setup()
		require("mini.pick").setup()
		require("mini.diff").setup()
		require("mini.pairs").setup()

		-- Visual flair
		--
		require("mini.icons").setup()
		require("mini.indentscope").setup()
		require("mini.hipatterns").setup({
			highlighters = {
				fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
				hack = { pattern = "HACK", group = "MiniHipatternsHack" },
				todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
			},
		})

		-- require("mini.base16").setup({
		-- 	palette = {
		-- 		base00 = "#000000",
		-- 		-- base01 = '#000000',
		-- 		base01 = "#131721",
		-- 		base02 = "#272D38",
		-- 		base03 = "#3E4B59",
		-- 		base04 = "#BFBDB6",
		-- 		base05 = "#E6E1CF",
		-- 		base06 = "#E6E1CF",
		-- 		base07 = "#F3F4F5",
		-- 		base08 = "#F07178",
		-- 		base09 = "#FF8F40",
		-- 		base0A = "#FFB454",
		-- 		base0B = "#B8CC52",
		-- 		base0C = "#95E6CB",
		-- 		base0D = "#59C2FF",
		-- 		base0E = "#D2A6FF",
		-- 		base0F = "#E6B673",
		-- 	},
		-- })

		require("mini.surround").setup()
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		local animate = require("mini.animate")
		local animation_time = 60
		animate.setup({
			cursor = {
				timing = animate.gen_timing.linear({ duration = animation_time, unit = "total" }),
			},
			scroll = {
				timing = animate.gen_timing.linear({ duration = animation_time, unit = "total" }),
			},
			open = {
				timing = animate.gen_timing.linear({ duration = animation_time, unit = "total" }),
			},
		})

		-- niceties
		require("mini.trailspace").setup()
		require("mini.basics").setup()
		require("mini.extra").setup()
		local miniclue = require("mini.clue")
		miniclue.setup({
			triggers = {
				-- Leader triggers
				{ mode = "n", keys = "<Leader>" },
				{ mode = "x", keys = "<Leader>" },

				-- Built-in completion
				{ mode = "i", keys = "<C-x>" },

				-- `g` key
				{ mode = "n", keys = "g" },
				{ mode = "x", keys = "g" },

				-- Marks
				{ mode = "n", keys = "'" },
				{ mode = "n", keys = "`" },
				{ mode = "x", keys = "'" },
				{ mode = "x", keys = "`" },

				-- Registers
				{ mode = "n", keys = '"' },
				{ mode = "x", keys = '"' },
				{ mode = "i", keys = "<C-r>" },
				{ mode = "c", keys = "<C-r>" },

				-- Window commands
				{ mode = "n", keys = "<C-w>" },

				-- `z` key
				{ mode = "n", keys = "z" },
				{ mode = "x", keys = "z" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},
		})
	end,
}
