local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local config = {
  pickers = {
    find_files = {
      hidden = true,
    },
  },
}

telescope.setup(config)
