local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local config = {
  open_mapping = [[<leader>t]],
  insert_mappings = false,
  terminal_mapping = false,
}
toggleterm.setup(config)
