-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Font config
config.font = wezterm.font_with_fallback({
  { family = 'JetBrains Mono', weight = 'Medium' },
  { family = 'JetBrainsMono Nerd Font', weight = 'Medium' },
})
config.font_size = 13
config.line_height = 1.05
config.use_cap_height_to_scale_fallback_fonts = true

-- Window config
config.hide_tab_bar_if_only_one_tab = true
config.native_macos_fullscreen_mode = true

-- Set color scheme dynamically, depending on the Light/Dark mode of MacOS
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Frappe'
  else
    return 'Catppuccin Latte'
  end
end
config.color_scheme = scheme_for_appearance(get_appearance())

return config
