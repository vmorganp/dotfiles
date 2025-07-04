-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.font_size = 18
config.hide_tab_bar_if_only_one_tab = true

config.max_fps = 60
config.animation_fps = 60
config.color_scheme = 'Ayu Dark (Gogh)'
config.colors = {
    background = 'black'
}

-- de-pad
config.window_frame = {
    border_left_width = '0cell',
    border_right_width = '0cell',
    border_bottom_height = '0cell',
    border_top_height = '0cell',
}
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.enable_scroll_bar = false

config.font = wezterm.font_with_fallback {
    {
        family = 'DejaVuSansM Nerd Font Mono',
        weight = 'Regular'
    },
    {
        family = 'IosevkaTerm NFM Italic',
        italic = true,
    },
}

-- Finally, return the configuration to wezterm:
return config
