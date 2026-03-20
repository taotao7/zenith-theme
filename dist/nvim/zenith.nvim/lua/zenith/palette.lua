      -- Zenith palette (generated from palette.toml)
      local M = {}

      M.dark = {
        base = {
  bg = "#161621",
  bg_dim = "#121218",
  bg1 = "#1e1e2e",
  bg2 = "#262640",
  bg3 = "#2e2e4a",
  bg4 = "#383860",
  border = "#3a3a58",
},
text = {
  fg = "#c8cfe6",
  fg_dim = "#8e95b0",
  comment = "#5c6888",
},
accent = {
  red = "#f07088",
  orange = "#e09868",
  yellow = "#e0c070",
  green = "#70c890",
  cyan = "#60c8d8",
  blue = "#6898f0",
  purple = "#b070e8",
  pink = "#e070a8",
},
diagnostic = {
  error = "#f05068",
  warn = "#e0a040",
  info = "#60b0e0",
  hint = "#70c890",
},
git = {
  add = "#70c890",
  change = "#e0c070",
  delete = "#f07088",
},
      }

      M.light = {
        base = {
  bg = "#f0edf8",
  bg_dim = "#f5f3fb",
  bg1 = "#e6e3f0",
  bg2 = "#dcd8e8",
  bg3 = "#cfc8e0",
  bg4 = "#c4c0d8",
  border = "#b8b0cc",
},
text = {
  fg = "#2a2840",
  fg_dim = "#5c5878",
  comment = "#8880a8",
},
accent = {
  red = "#c83858",
  orange = "#b86828",
  yellow = "#907020",
  green = "#2a8858",
  cyan = "#1880a0",
  blue = "#3060c0",
  purple = "#6838b0",
  pink = "#b83878",
},
diagnostic = {
  error = "#c02040",
  warn = "#a07010",
  info = "#2070b0",
  hint = "#2a8858",
},
git = {
  add = "#2a8858",
  change = "#907020",
  delete = "#c83858",
},
      }

      return M
