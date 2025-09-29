local wezterm = require 'wezterm'
local config = {}


config.font_size                     = 16
config.font                          = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
config.hide_tab_bar_if_only_one_tab  = true
config.hide_mouse_cursor_when_typing = true
config.default_cursor_style          = 'SteadyBlock'
config.window_decorations            = "RESIZE"
config.window_background_opacity     = 0.80
config.macos_window_background_blur  = 30

-- old laptop friendy
config.animation_fps = 1
config.front_end = "OpenGL"


return config
