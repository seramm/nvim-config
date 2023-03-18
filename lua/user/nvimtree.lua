local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config = {
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

nvimtree.setup(config)
