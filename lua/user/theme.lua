local status_ok, tokyonight = pcall(require, "tokyonight")
if not status_ok then
  return
end

local config = {
  style = "night",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help", "packer" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = false,
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
}

tokyonight.setup(config)

vim.cmd[[colorscheme tokyonight]]
