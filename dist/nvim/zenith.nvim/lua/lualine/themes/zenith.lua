-- Zenith lualine theme (generated)
local palette = require("zenith.palette")

local function get_theme()
  local style = vim.o.background or "dark"
  local p = palette[style] or palette.dark

  return {
    normal = {
      a = { fg = p.base.bg, bg = p.accent.blue, gui = "bold" },
      b = { fg = p.text.fg_dim, bg = p.base.bg2 },
      c = { fg = p.text.comment, bg = "NONE" },
    },
    insert = {
      a = { fg = p.base.bg, bg = p.accent.green, gui = "bold" },
      b = { fg = p.text.fg_dim, bg = p.base.bg2 },
    },
    visual = {
      a = { fg = p.base.bg, bg = p.accent.purple, gui = "bold" },
      b = { fg = p.text.fg_dim, bg = p.base.bg2 },
    },
    replace = {
      a = { fg = p.base.bg, bg = p.accent.red, gui = "bold" },
      b = { fg = p.text.fg_dim, bg = p.base.bg2 },
    },
    command = {
      a = { fg = p.base.bg, bg = p.accent.yellow, gui = "bold" },
      b = { fg = p.text.fg_dim, bg = p.base.bg2 },
    },
    inactive = {
      a = { fg = p.text.comment, bg = p.base.bg1 },
      b = { fg = p.text.comment, bg = p.base.bg1 },
      c = { fg = p.text.comment, bg = "NONE" },
    },
  }
end

return get_theme()
