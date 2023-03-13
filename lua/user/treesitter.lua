-- Tree Sitter config

local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = {
    "bash",
    "bibtex",
    "c",
    "cpp",
    "diff",
    "gitconfig",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "java",
    "latex",
    "lua",
    "lua patterns",
    "markdown",
    "python",
    "regex",
    "toml"
  },
  sync_installed = true,
  auto_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}

