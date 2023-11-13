local wezterm = require "wezterm"
local act = wezterm.action
local colors = require "colors"

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.front_end = "WebGpu"
config.debug_key_events = true

config.default_workspace = "williamhou"

config.font = wezterm.font_with_fallback {
  { family = "SF Mono", weight = "Medium" },
  "Hack Nerd Font",
}
config.font_size = 15.0
config.line_height = 1.35
-- config.cell_width = 0.90

-- ui
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20

config.window_padding = {
  bottom = 0,
}

-- wezterm.on("update-right-status", function(window, pane)
--   window:set_right_status(
--     wezterm.format {
--       { Background = { Color = colors.dark_bg } },
--       { Foreground = { Color = colors.fg } },
--       { Text = window:active_workspace() .. " " },
--     }
--   )
-- end)

config.window_decorations = "RESIZE"
-- config.window_frame = {
--   font = wezterm.font { family = "SF Mono", weight = "Bold" },
--   font_size = 14.0,
--   active_titlebar_bg = colors.dark_bg,
--   inactive_titlebar_bg = colors.dark_bg,
-- }
config.hide_tab_bar_if_only_one_tab = true

-- config.color_scheme = "Github"
config.bold_brightens_ansi_colors = "No"
config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = colors.bg,
      fg_color = colors.fg,
    },
    inactive_tab = {
      bg_color = colors.dark_bg,
      fg_color = colors.comment,
    },
    inactive_tab_hover = {
      bg_color = colors.selection,
      fg_color = colors.comment,
      italic = true,
    },
    new_tab = {
      bg_color = colors.bg,
      fg_color = colors.comment,
    },
    new_tab_hover = {
      bg_color = colors.selection,
      fg_color = colors.comment,
      italic = true,
    },
  },

  ansi = colors.ansi,
  brights = colors.brights,
  background = colors.bg,
  foreground = colors.fg,
  selection_bg = colors.selection,
  selection_fg = colors.fg
}

-- key bindings
config.disable_default_key_bindings = true
config.keys = {
  -- app
  { key = "r", mods = "SUPER", action = act.ReloadConfiguration },
  { key = "h", mods = "SUPER", action = act.HideApplication },
  { key = "q", mods = "SUPER", action = act.QuitApplication },

  -- shell
  -- { key = "t", mods = "SUPER", action = act.SpawnTab "CurrentPaneDomain" },
  { key = "t", mods = "SUPER", action = act.SendString "\x01c" },
  { key = "n", mods = "SUPER", action = act.SpawnWindow },
  -- { key = "w", mods = "SUPER", action = act.CloseCurrentTab { confirm = false } },
  { key = "w", mods = "SUPER", action = act.SendString "\x01k" },
  { key = "w", mods = "SHIFT|SUPER", action = act.SendString "\x01K" },


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
  -- { key = "{", mods = "SUPER", action = act.ActivateTabRelative(-1) },
  { key = "{", mods = "SHIFT|SUPER", action = act.SendString "\x01p" },
  -- { key = "}", mods = "SUPER", action = act.ActivateTabRelative(1) },
  { key = "}", mods = "SHIFT|SUPER", action = act.SendString "\x01n" },
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

  -- tmux
  { key = "r", mods = "SUPER", action = act.SendString "\x01s" },
  { key = "l", mods = "SUPER", action = act.SendString "\x01L" },

  -- remap ctrl + [ to esc
  -- { key = "[", mods = "CTRL", action = act.SendKey { key = "Escape" } },

  -- {
  --   key = "r",
  --   mods = "SUPER",
  --   action = act.ShowLauncherArgs {
  --     flags = "WORKSPACES",
  --   },
  -- },

  -- {
  --   key = "r",
  --   mods = "SHIFT|SUPER",
  --   action = wezterm.action_callback(function(window, pane)
  --     local cmd = [[
  --     echo "$({
  --       echo $HOME/.dotfiles;
  --       echo $HOME/.config/nvim;
  --       echo $HOME/Documents/Notes;
  --       find $HOME/Documents/Coding -mindepth 2 -maxdepth 2 -type d;
  --     })"
  --     ]]
  --     local file = io.popen(cmd)
  --     local output = file:read("*a")
  --     file:close()

  --     local choices = {}
  --     for directory in string.gmatch(output, "([^\n]+)") do
  --       table.insert(choices, { label = directory })
  --     end

  --     window:perform_action(
  --       act.InputSelector {
  --         title = "Workspaces",
  --         choices = choices,
  --         action = wezterm.action_callback(function(window, pane, id, label)
  --           if label then
  --             window:perform_action(act.SwitchToWorkspace {
  --               name = label:match("([^/]+)$"),
  --               spawn = {
  --                 cwd = label,
  --               }
  --             }, pane)
  --           end
  --         end),
  --       }, pane)
  --   end),
  -- },
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
