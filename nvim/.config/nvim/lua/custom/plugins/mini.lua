return {
	-- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.comment").setup()
		require("mini.notify").setup()
		require("mini.tabline").setup()

		require("mini.diff").setup()

		-- Centered on screen
		local win_config = function()
			local height = math.floor(0.7 * vim.o.lines)
			local width = math.floor(0.7 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.5 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end

		-- send selected to qf
		local choose_all = function()
			local mappings = MiniPick.get_picker_opts().mappings
			vim.api.nvim_input(mappings.mark_all .. mappings.choose_marked)
		end

		require("mini.pick").setup({
			mappings = {
				choose_all = { char = "<C-q>", func = choose_all },
			},
			window = { config = win_config },
		})

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

		require("mini.surround").setup()
		local statusline = require("mini.statusline")
		statusline.setup({ use_icons = vim.g.have_nerd_font })
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		-- niceties
		require("mini.trailspace").setup()
		require("mini.basics").setup({
			mappings = {
				option_toggle_prefix = "<Leader>T",
			},
		})
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

				-- `[]` keys
				{ mode = "n", keys = "[" },
				{ mode = "n", keys = "]" },
			},

			clues = {
				-- Enhance this by adding descriptions for <Leader> mapping groups
				miniclue.gen_clues.square_brackets(),
				miniclue.gen_clues.builtin_completion(),
				miniclue.gen_clues.g(),
				miniclue.gen_clues.marks(),
				miniclue.gen_clues.registers(),
				miniclue.gen_clues.windows(),
				miniclue.gen_clues.z(),
			},

			-- thx again maria
			window = {
				delay = 300,
				config = function(bufnr)
					local max_width = 0
					for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)) do
						max_width = math.max(max_width, vim.fn.strchars(line))
					end

					-- Keep some right padding.
					max_width = max_width + 2

					return {
						-- Dynamic width capped at 70.
						width = math.min(70, max_width),
					}
				end,
			},
		})
	end,
}
