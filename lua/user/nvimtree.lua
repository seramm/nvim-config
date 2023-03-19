local status_ok, nvimtree = pcall(require, "nvim-tree")

if not status_ok then
  return
end

local config = {
auto_reload_on_write = true,
  hijack_cursor = false,
  hijack_unnamed_buffer_when_opening = true,
  reload_on_bufenter = true,
  respect_buf_cwd = false,
  view = {
    cursorline = true,
    debounce_delay = 15,
    width = 30,
    side = "left",
    preserve_window_proportions = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        { key = "l", action = "edit" },
        { key = "v", action = "vsplit" },
      },
    },
  },
  renderer = {
    highlight_opened_files = "name",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
      modified_placement = "after",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = false,
  },
  diagnostics = {
    enable = true,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
}

nvimtree.setup(config)
