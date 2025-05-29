local wezterm = require 'wezterm'

return {
  -- Thiết lập font nếu bạn muốn (tùy chọn)
  font = wezterm.font 'JetBrains Mono',
  font_size = 12.0,

  -- Thiết lập mặc định khi bật lên: chạy WSL2 (ví dụ: Ubuntu)
  default_prog = { 'wsl.exe', '~' },

  -- Tùy chỉnh theme (tùy chọn)
  color_scheme = 'Catppuccin Mocha',

  -- Tự động đặt title theo lệnh
  automatically_reload_config = true,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
}

