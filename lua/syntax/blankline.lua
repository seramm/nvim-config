local status_ok_1, ibl = pcall(require, "ibl")
if not status_ok_1 then
  return
end

local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowGreen",
  "RainbowCyan",
  "RainbowBlue",
  "RainbowViolet",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
end)

local config = {
  indent = {
    highlight = highlight,
  },
}

ibl.setup(config)
