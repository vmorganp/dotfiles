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

