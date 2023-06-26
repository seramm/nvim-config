local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

local config = {
  open_mapping = [[<m-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true,
  close_on_exit = true,
  terminal_mapping = false,
}
toggleterm.setup(config)
