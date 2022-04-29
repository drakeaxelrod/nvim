-- foreground = "#bbc2cf",
-- background = "#282c34",
-- color0 = "#282c34",
-- color1 = "#ff6c6b",
-- color2 = "#98be65",
-- color3 = "#ecbe7b",
-- color4 = "#51afef",
-- color5 = "#a9a1e1",
-- color6 = "#46d9ff",
-- color7 = "#bbc2cf",
-- color8 = "#3f444a",
-- color9 = "#ff6c6b",
-- color10 = "#98be65",
-- color11 = "#da8548",
-- color12 = "#51afef",
-- color13 = "#a9a1e1",
-- color14 = "#46d9ff",
-- color15 = "#efefef",
-- cursor = "#51afef",
-- cursor_text_color = "#282c34",
-- url_color = "#98be65",
-- selection_foreground = "NONE",
-- selection_background = "#2257a0",
-- tab_bar_background = "#16181c",
-- active_tab_foreground = "#bbc2cf",
-- active_tab_background = "#282c34",
-- inactive_tab_foreground = "#5b6268",
-- inactive_tab_background = "#1e2127",
-- active_border_color = "#51afef",
-- inactive_border_color = "#3f444a",
-- bell_border_color = "#ecbe7b",


local c = require("lib.colors")

local function section(bg, fg)
  bg = bg or "fg"
  fg = fg or "bg"
  return {
    a = { fg = fg, bg = bg, gui = "bold" },
    b = { fg = fg, bg = bg, gui = "bold" },
    c = { fg = fg, bg = bg, gui = "bold" },
    x = { fg = fg, bg = bg, gui = "bold" },
    y = { fg = fg, bg = bg, gui = "bold" },
    z = { fg = fg, bg = bg, gui = "bold" },
  }
end

local function template()
  local bg = "fg"
  local fg = "bg"
  return {
    normal = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    insert = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    visual = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    replace = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    command = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    inactive = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    }
  }
end

return function()
  return {
    inactive = section(c.foreground, c.background),
    visual = section(c.color3, c.background),
    replace = section(c.color1, c.background),
    insert = section(c.color4, c.background),
    normal = section(c.foreground, c.background),
    command = section(c.color5, c.background),
  }
end
