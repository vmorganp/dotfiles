return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      on_colors = function(colors)
        colors.bg            = "#000000"
        colors.bg_dark       = "#000000"
        colors.bg_sidebar    = "#000000"
        colors.bg_statusline = "#000000"
      end
    })
    vim.cmd [[colorscheme tokyonight-night]]
  end
}

-- custom ayu-like with black background. Doesn't player super nice with diffview and stuff like that though :(
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
