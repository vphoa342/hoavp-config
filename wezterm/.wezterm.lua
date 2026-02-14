local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.leader = { key = 'a', mods = 'CTRL' , timeout_milliseconds = 1000 }
config.keys = {
  -- Chia màn hình dọc (như Tmux C-a |)
  {
    key = '|',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Chia màn hình ngang (như Tmux C-a -)
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Di chuyển giữa các Pane bằng phím mũi tên (như ông thích)
  {
    key = 'LeftArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'LEADER',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },
  -- Đóng Pane hiện tại (như Tmux C-a x)
  {
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Tạo Tab mới (như Tmux C-a c)
  {
    key = 'c',
    mods = 'LEADER',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  -- Đóng Tab hiện tại (như Tmux C-a & - nhưng tui đổi thành q cho dễ)
  {
    key = 'q',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  -- Chuyển sang Tab bên phải (Ctrl + a rồi nhấn Mũi tên Phải trong khi giữ Shift)
  {
    key = 'RightArrow',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- Chuyển sang Tab bên trái (Ctrl + a rồi nhấn Mũi tên Trái trong khi giữ Shift)
  {
    key = 'LeftArrow',
    mods = 'LEADER|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  -- Chuyển trực tiếp đến Tab theo số (C-a 1, C-a 2...)
  { key = '1', mods = 'LEADER', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'LEADER', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'LEADER', action = wezterm.action.ActivateTab(2) },
}

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 12.0
config.default_prog = { 'wsl.exe', '~' }
config.color_scheme = 'Catppuccin Mocha'
config.automatically_reload_config = true
config.window_background_opacity = 0.9
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

return config
