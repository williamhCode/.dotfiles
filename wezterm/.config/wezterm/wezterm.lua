local wezterm = require "wezterm"
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.window_frame = {
  font = wezterm.font { family = "Roboto", weight = "Bold" },
  font_size = 13.0,
  active_titlebar_bg = "#22252b",
  inactive_titlebar_bg = "#22252b",
}

config.font = wezterm.font "SF Mono"
config.font_size = 15.0
config.line_height = 1.35

config.bold_brightens_ansi_colors = "No"
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#282c34",
      fg_color = "#abb2bf",
    },
    inactive_tab = {
      bg_color = "#22252b",
      fg_color = "#7f848e",
    },
    inactive_tab_hover = {
      bg_color = "#414858",
      fg_color = "#7f848e",
      italic = true,
    },
    new_tab = {
      bg_color = "#282c34",
      fg_color = "#7f848e",
    },
    new_tab_hover = {
      bg_color = "#414858",
      fg_color = "#7f848e",
      italic = true,
    },
  },

  ansi = {
    "#282c34",
    "#e06c75",
    "#98c379",
    "#e5c07b",
    "#61afef",
    "#c678dd",
    "#56b6c2",
    "#abb2bf",
  },
  brights = {
    "#5c6370",
    "#e9969d",
    "#b3d39c",
    "#edd4a6",
    "#8fc6f4",
    "#d7a1e7",
    "#7bc6d0",
    "#c8cdd5",
  },
  background = "#282c34",
  foreground = "#abb2bf",
  selection_bg = "#c678dd",
  selection_fg = "#abb2bf",
}

-- key bindings
config.disable_default_key_bindings = true
config.keys = {
  -- app
  { key = "r", mods = "SUPER", action = act.ReloadConfiguration },
  { key = "h", mods = "SUPER", action = act.HideApplication },
  { key = "q", mods = "SUPER", action = act.QuitApplication },

  -- shell
  { key = "t", mods = "SUPER", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "n", mods = "SUPER", action = act.SpawnWindow },
  { key = "w", mods = "SUPER", action = act.CloseCurrentTab { confirm = true } },

  -- edit
  { key = "c", mods = "SUPER", action = act.CopyTo "Clipboard" },
  { key = "v", mods = "SUPER", action = act.PasteFrom "Clipboard" },
  { key = "k", mods = "SUPER", action = act.ClearScrollback "ScrollbackOnly" },
  { key = "x", mods = "SHIFT|CTRL", action = act.ActivateCopyMode },
  { key = "p", mods = "SHIFT|SUPER", action = act.ActivateCommandPalette },
  { key = "f", mods = "SUPER", action = act.Search "CurrentSelectionOrEmptyString" },

  -- view
  { key = "-", mods = "SUPER", action = act.DecreaseFontSize },
  { key = "=", mods = "SUPER", action = act.IncreaseFontSize },
  { key = "0", mods = "SUPER", action = act.ResetFontSize },
  { key = "Enter", mods = "ALT", action = act.ToggleFullScreen },

  -- window
  { key = "m", mods = "SUPER", action = act.Hide },
  { key = "1", mods = "SUPER", action = act.ActivateTab(0) },
  { key = "2", mods = "SUPER", action = act.ActivateTab(1) },
  { key = "3", mods = "SUPER", action = act.ActivateTab(2) },
  { key = "4", mods = "SUPER", action = act.ActivateTab(3) },
  { key = "5", mods = "SUPER", action = act.ActivateTab(4) },
  { key = "6", mods = "SUPER", action = act.ActivateTab(5) },
  { key = "7", mods = "SUPER", action = act.ActivateTab(6) },
  { key = "8", mods = "SUPER", action = act.ActivateTab(7) },
  { key = "9", mods = "SUPER", action = act.ActivateTab(-1) },
  { key = "{", mods = "SUPER", action = act.ActivateTabRelative(-1) },
  { key = "}", mods = "SUPER", action = act.ActivateTabRelative(1) },
  { key = "z", mods = "SHIFT|CTRL", action = act.TogglePaneZoomState },

  -- other
  { key = "l", mods = "SHIFT|CTRL", action = act.ShowDebugOverlay },
  { key = "Backspace", mods = "SUPER", action = act.SendString "\x15" },
  { key = "b", mods = "SUPER", action = act.SendString "\x1bsb" },
  { key = "j", mods = "SUPER", action = act.SendString "\x1bsj" },
  { key = "/", mods = "SUPER", action = act.SendString "\x1bs/" },
  { key = "[", mods = "SUPER", action = act.SendString "\x1bs[" },
  { key = "]", mods = "SUPER", action = act.SendString "\x1bs]" },
  { key = "a", mods = "SUPER", action = act.SendString "\x1bsa" },
}

config.key_tables = {
  copy_mode = {
    { key = "Tab", mods = "NONE", action = act.CopyMode "MoveForwardWord" },
    { key = "Tab", mods = "SHIFT", action = act.CopyMode "MoveBackwardWord" },
    { key = "Enter", mods = "NONE", action = act.CopyMode "MoveToStartOfNextLine" },
    { key = "Escape", mods = "NONE", action = act.CopyMode "Close" },
    { key = "Space", mods = "NONE", action = act.CopyMode { SetSelectionMode = "Cell" } },
    { key = "$", mods = "NONE", action = act.CopyMode "MoveToEndOfLineContent" },
    { key = "$", mods = "SHIFT", action = act.CopyMode "MoveToEndOfLineContent" },
    { key = ",", mods = "NONE", action = act.CopyMode "JumpReverse" },
    { key = "0", mods = "NONE", action = act.CopyMode "MoveToStartOfLine" },
    { key = ";", mods = "NONE", action = act.CopyMode "JumpAgain" },
    { key = "F", mods = "NONE", action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = "F", mods = "SHIFT", action = act.CopyMode { JumpBackward = { prev_char = false } } },
    { key = "G", mods = "NONE", action = act.CopyMode "MoveToScrollbackBottom" },
    { key = "G", mods = "SHIFT", action = act.CopyMode "MoveToScrollbackBottom" },
    { key = "H", mods = "NONE", action = act.CopyMode "MoveToViewportTop" },
    { key = "H", mods = "SHIFT", action = act.CopyMode "MoveToViewportTop" },
    { key = "L", mods = "NONE", action = act.CopyMode "MoveToViewportBottom" },
    { key = "L", mods = "SHIFT", action = act.CopyMode "MoveToViewportBottom" },
    { key = "M", mods = "NONE", action = act.CopyMode "MoveToViewportMiddle" },
    { key = "M", mods = "SHIFT", action = act.CopyMode "MoveToViewportMiddle" },
    { key = "O", mods = "NONE", action = act.CopyMode "MoveToSelectionOtherEndHoriz" },
    { key = "O", mods = "SHIFT", action = act.CopyMode "MoveToSelectionOtherEndHoriz" },
    { key = "T", mods = "NONE", action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = "T", mods = "SHIFT", action = act.CopyMode { JumpBackward = { prev_char = true } } },
    { key = "V", mods = "NONE", action = act.CopyMode { SetSelectionMode = "Line" } },
    { key = "V", mods = "SHIFT", action = act.CopyMode { SetSelectionMode = "Line" } },
    { key = "^", mods = "NONE", action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "^", mods = "SHIFT", action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "b", mods = "NONE", action = act.CopyMode "MoveBackwardWord" },
    { key = "b", mods = "ALT", action = act.CopyMode "MoveBackwardWord" },
    { key = "b", mods = "CTRL", action = act.CopyMode "PageUp" },
    { key = "c", mods = "CTRL", action = act.CopyMode "Close" },
    { key = "d", mods = "CTRL", action = act.CopyMode { MoveByPage = (0.5) } },
    { key = "e", mods = "NONE", action = act.CopyMode "MoveForwardWordEnd" },
    { key = "f", mods = "NONE", action = act.CopyMode { JumpForward = { prev_char = false } } },
    { key = "f", mods = "ALT", action = act.CopyMode "MoveForwardWord" },
    { key = "f", mods = "CTRL", action = act.CopyMode "PageDown" },
    { key = "g", mods = "NONE", action = act.CopyMode "MoveToScrollbackTop" },
    { key = "g", mods = "CTRL", action = act.CopyMode "Close" },
    { key = "h", mods = "NONE", action = act.CopyMode "MoveLeft" },
    { key = "j", mods = "NONE", action = act.CopyMode "MoveDown" },
    { key = "k", mods = "NONE", action = act.CopyMode "MoveUp" },
    { key = "l", mods = "NONE", action = act.CopyMode "MoveRight" },
    { key = "m", mods = "ALT", action = act.CopyMode "MoveToStartOfLineContent" },
    { key = "o", mods = "NONE", action = act.CopyMode "MoveToSelectionOtherEnd" },
    { key = "q", mods = "NONE", action = act.CopyMode "Close" },
    { key = "t", mods = "NONE", action = act.CopyMode { JumpForward = { prev_char = true } } },
    { key = "u", mods = "CTRL", action = act.CopyMode { MoveByPage = (-0.5) } },
    { key = "v", mods = "NONE", action = act.CopyMode { SetSelectionMode = "Cell" } },
    { key = "v", mods = "CTRL", action = act.CopyMode { SetSelectionMode = "Block" } },
    { key = "w", mods = "NONE", action = act.CopyMode "MoveForwardWord" },
    {
      key = "y",
      mods = "NONE",
      action = act.Multiple { { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }
    },
    { key = "PageUp", mods = "NONE", action = act.CopyMode "PageUp" },
    { key = "PageDown", mods = "NONE", action = act.CopyMode "PageDown" },
    { key = "End", mods = "NONE", action = act.CopyMode "MoveToEndOfLineContent" },
    { key = "Home", mods = "NONE", action = act.CopyMode "MoveToStartOfLine" },
    { key = "LeftArrow", mods = "NONE", action = act.CopyMode "MoveLeft" },
    { key = "LeftArrow", mods = "ALT", action = act.CopyMode "MoveBackwardWord" },
    { key = "RightArrow", mods = "NONE", action = act.CopyMode "MoveRight" },
    { key = "RightArrow", mods = "ALT", action = act.CopyMode "MoveForwardWord" },
    { key = "UpArrow", mods = "NONE", action = act.CopyMode "MoveUp" },
    { key = "DownArrow", mods = "NONE", action = act.CopyMode "MoveDown" },
  },

  search_mode = {
    { key = "Enter", mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "Escape", mods = "NONE", action = act.CopyMode "Close" },
    { key = "n", mods = "CTRL", action = act.CopyMode "NextMatch" },
    { key = "p", mods = "CTRL", action = act.CopyMode "PriorMatch" },
    { key = "r", mods = "CTRL", action = act.CopyMode "CycleMatchType" },
    { key = "u", mods = "CTRL", action = act.CopyMode "ClearPattern" },
    { key = "PageUp", mods = "NONE", action = act.CopyMode "PriorMatchPage" },
    { key = "PageDown", mods = "NONE", action = act.CopyMode "NextMatchPage" },
    { key = "UpArrow", mods = "NONE", action = act.CopyMode "PriorMatch" },
    { key = "DownArrow", mods = "NONE", action = act.CopyMode "NextMatch" },
  },
}

return config
