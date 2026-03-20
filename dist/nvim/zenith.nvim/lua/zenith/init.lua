-- Zenith colorscheme for Neovim
local M = {}

M.config = {
  style = "auto",          -- "dark", "light", or "auto" (follows vim.o.background)
  transparent = false,     -- transparent background
  dim_inactive = true,     -- dim non-active splits (depth-of-field effect)
}

function M.setup(opts)
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

function M.load()
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "zenith"

  local config = M.config
  local style = config.style
  if style == "auto" then
    style = vim.o.background
  else
    vim.o.background = style
  end

  local palette = require("zenith.palette")
  local p = palette[style] or palette.dark

  -- Apply highlight groups
  require("zenith.theme").setup(p, config)

  -- Apply terminal ANSI colors
  vim.g.terminal_color_0  = p.base.bg1
  vim.g.terminal_color_1  = p.accent.red
  vim.g.terminal_color_2  = p.accent.green
  vim.g.terminal_color_3  = p.accent.yellow
  vim.g.terminal_color_4  = p.accent.blue
  vim.g.terminal_color_5  = p.accent.purple
  vim.g.terminal_color_6  = p.accent.cyan
  vim.g.terminal_color_7  = p.text.fg
  vim.g.terminal_color_8  = p.text.comment
  vim.g.terminal_color_9  = p.accent.red
  vim.g.terminal_color_10 = p.accent.green
  vim.g.terminal_color_11 = p.accent.yellow
  vim.g.terminal_color_12 = p.accent.blue
  vim.g.terminal_color_13 = p.accent.purple
  vim.g.terminal_color_14 = p.accent.cyan
  vim.g.terminal_color_15 = p.text.fg
end

return M
