-- Which Key config

local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  key_labels = {
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
    ["<leader>"] = "SPC",
  },
  icons = {
    breadcrumb = "»",
    separator = "",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = false,
  show_keys = false,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  disable = {
    buftypes = {},
    filetypes = {},
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
local mappings = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open Tree", nowait = false, remap = false },
    { "<leader>f", group = "Telescope", nowait = false, remap = false },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers", nowait = false, remap = false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files", nowait = false, remap = false },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep", nowait = false, remap = false },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags", nowait = false, remap = false },
    { "<leader>g", group = "Comment", nowait = false, remap = false },
    { "<leader>gb", group = "Blockwise", nowait = false, remap = false },
    { "<leader>gbc", desc = "Current line", nowait = false, remap = false },
    { "<leader>gb}", desc = "Next blank line", nowait = false, remap = false },
    { "<leader>gc", group = "Linewise", nowait = false, remap = false },
    { "<leader>gc$", desc = "End of line", nowait = false, remap = false },
    { "<leader>gcA", desc = "Current line and INSERT", nowait = false, remap = false },
    { "<leader>gcO", desc = "Previous line and INSERT", nowait = false, remap = false },
    { "<leader>gca", group = "Curly brackets", nowait = false, remap = false },
    { "<leader>gca}", desc = "Curly brackets", nowait = false, remap = false },
    { "<leader>gcc", desc = "Current line", nowait = false, remap = false },
    { "<leader>gcip", desc = "Full paragraph", nowait = false, remap = false },
    { "<leader>gcj", desc = "Next line", nowait = false, remap = false },
    { "<leader>gck", desc = "Previous line", nowait = false, remap = false },
    { "<leader>gco", desc = "Next line and INSERT", nowait = false, remap = false },
    { "<leader>gcw", desc = "Next word", nowait = false, remap = false },
    { "<leader>gc}", desc = "Blank line", nowait = false, remap = false },
    { "<leader>s", group = "Splits", nowait = false, remap = false },
    { "<leader>sh", "<cmd>split<cr>", desc = "Horizontal Split", nowait = false, remap = false },
    { "<leader>sv", "<cmd>vsplit<cr>", desc = "Vertical Split", nowait = false, remap = false },
    { "<leader>w", group = "Write", nowait = false, remap = false },
    { "<leader>wa", "<cmd>wa<cr>", desc = "Save all files", nowait = false, remap = false },
    { "<leader>ww", "<cmd>w<cr>", desc = "Save file", nowait = false, remap = false },
}

which_key.setup(setup)
which_key.add(mappings)
