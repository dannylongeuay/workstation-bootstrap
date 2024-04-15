local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.audible_bell = 'Disabled'
config.enable_tab_bar = false

return config
