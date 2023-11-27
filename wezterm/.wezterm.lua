local wezterm = require("wezterm")

local M = {}

-- Use the config_builder() for provide clearer error messages.
if wezterm.config_builder then M = wezterm.config_builder() end

-- Font: {{{

-- Face.
M.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })

-- Other options.
M.font_size   = 15.0
M.cell_width  = 1
M.line_height = 1.15

-- }}}

-- Colors & Appearance: {{{

M.colors = {

  -- General colors.
  split           = "#000000",
  background      = "#000000",
  foreground      = "#b9b9b9",
  selection_bg    = "#3b3b3b",
  selection_fg    = "#dedede",
  cursor_bg       = "#b9b9b9",
  cursor_fg       = "#252525",
  cursor_border   = "#83c746",
  compose_cursor  = "#83c746",
  scrollbar_thumb = "#3b3b3b",

  -- Ansi colors.
  ansi    = { "#252525", "#ed4a46", "#70b433", "#dbb32d", "#368aeb", "#eb6eb7", "#3fc5b7", "#777777" },
  brights = { "#3b3b3b", "#ff5e56", "#83c746", "#efc541", "#4f9cfe", "#ff81ca", "#56d8c9", "#dedede" },

  -- Copy mode colors.
  copy_mode_active_highlight_bg   = { Color = "#efc541" },
  copy_mode_active_highlight_fg   = { Color = "#252525" },
  copy_mode_inactive_highlight_bg = { Color = "#252525" },
  copy_mode_inactive_highlight_fg = { Color = "#b9b9b9" },

  -- Quick select colors.
  quick_select_label_bg = { Color = "#efc541" },
  quick_select_label_fg = { Color = "#252525" },
  quick_select_match_bg = { Color = "#62552e" },
  quick_select_match_fg = { Color = "#b9b9b9" },

  -- Tab bar colors.
  tab_bar = {
    background              = "#252525",
    active_tab              = { bg_color = "#000000", fg_color = "#83c746" },
    inactive_tab            = { bg_color = "#252525", fg_color = "#777777" },
    inactive_tab_hover      = { bg_color = "#252525", fg_color = "#83c746" },
    new_tab                 = { bg_color = "#252525", fg_color = "#777777" },
    new_tab_hover           = { bg_color = "#252525", fg_color = "#83c746" },
    inactive_tab_edge       = "#252525",
    inactive_tab_edge_hover = "#252525",
  },
}

-- Tab bar appareance: {{{

M.show_tab_index_in_tab_bar = false
M.hide_tab_bar_if_only_one_tab = true

M.window_frame = {
  font                 = wezterm.font("IBM Plex Sans", { weight = "Medium" }),
  font_size            = 13.0,
  active_titlebar_bg   = "#181818",
  inactive_titlebar_bg = "#252525",
}

-- }}}

-- Inactive panes.
M.inactive_pane_hsb = { saturation = 0.5, brightness = 0.5, hue = 0.5 }

-- }}}

return M

-- vim: foldmethod=marker foldlevel=0:
