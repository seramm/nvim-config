local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local config = {
  options = {
    theme = "tokyonight"
  }
}

lualine.setup(config)
