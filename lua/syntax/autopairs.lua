local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end
local config = {
  disable = { "TelescopePrompt", "vim" },
}
autopairs.setup(config)
