local status_ok_1, ibl = pcall(require, "ibl")
if not status_ok_1 then
  return
end

local config = {
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    injected_languages = true,
    highlight = { "Function", "Label" },
    priority = 500,
  },
}

ibl.setup(config)
