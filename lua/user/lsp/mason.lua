local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok1 then
  return
end


local config_mason = {
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    registries = {
        "lua:mason-registry.index",
    },
    providers = {
        "mason.providers.registry-api",
        "mason.providers.client",
    },
    pip = {
        upgrade_pip = false,
        install_args = {},
    },
    ui = {
        check_outdated_packages_on_open = true,
        border = "rounded",
        width = 0.8,
        height = 0.9,
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
        keymaps = {
            toggle_package_expand = "<CR>",
            install_package = "i",
            update_package = "u",
            check_package_version = "c",
            update_all_packages = "U",
            check_outdated_packages = "C",
            uninstall_package = "X",
            cancel_installation = "<C-c>",
            apply_language_filter = "<C-f>",
        },
    },
}
local config_mason_lspconfig = {
    ensure_installed = {"lua_ls"},

    automatic_installation = true,
}

mason.setup(config_mason)
mason_lspconfig.setup {config_mason_lspconfig}
