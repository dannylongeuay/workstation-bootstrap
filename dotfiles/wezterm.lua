local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- GENERAL --
config.color_scheme = 'Catppuccin Mocha'
config.audible_bell = 'Disabled'
config.adjust_window_size_when_changing_font_size = false

-- TAB BAR --
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.show_tab_index_in_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 48
-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on(
  'format-tab-title',
  function(tab, _, _, _, hover, max_width)
    local edge_background = '#11111b'
    local background = '#11111b'
    local foreground = '#6c7086'

    if tab.is_active then
      background = '#1e1e2e'
      foreground = '#f9e2af'
    elseif hover then
      background = '#313244'
      foreground = '#cdd6f4'
    end

    local edge_foreground = background

    local title = tab.active_pane.title

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)
-- KEY BINDINGS --
config.keys = {
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.DisableDefaultAssignment,
  },
  {
    key = 'n',
    mods = 'ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'h',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'd',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'r',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

return config
