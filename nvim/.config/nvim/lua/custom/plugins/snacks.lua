return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = {
			hidden = true
		},
		bigfile = { enabled = true },
		explorer = {
			enabled = true,
		},
		quickfile = { enabled = true },
		-- scroll = {
		-- 	enabled = true,
		-- 	animate = {
		-- 		duration = { step = 15, total = 120 },
		-- 		easing = "linear",
		-- 	},
		-- 	-- faster animation when repeating scroll after delay
		-- 	animate_repeat = {
		-- 		delay = 200, -- delay in ms before using the repeat animation
		-- 		duration = { step = 5, total = 20 },
		-- 		easing = "linear",
		-- 	},
		-- 	-- what buffers to animate
		-- 	filter = function(buf)
		-- 		return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and
		-- 			vim.bo[buf].buftype ~= "terminal"
		-- 	end,
		-- }
	},
}
