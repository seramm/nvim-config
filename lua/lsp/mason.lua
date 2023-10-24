local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok1 then
  return
end

local status_ok2, lspconfig = pcall(require, "lspconfig")
if not status_ok2 then
  return
end

local config_mason = {
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
  registries = {
    "lua:mason-registry.index",
    "github:mason-org/mason-registry",
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
  ensure_installed = {},
  automatic_installation = false,
}

mason.setup(config_mason)
mason_lspconfig.setup({ config_mason_lspconfig })
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({})
  end,
  ["lua_ls"] = function()
    require("neodev").setup({})
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          format = {
            enable = false,
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = {
              vim.api.nvim_get_runtime_file("", true),
              ["/usr/share/nvim/runtime/lua"] = true,
              ["/usr/share/nvim/runtime/lua/lsp"] = true,
              ["/usr/share/awesome/lib"] = true,
            },
            checkThirdParty = false,
          },
        },
      },
    })
  end,
  ["texlab"] = function()
    lspconfig.texlab.setup({
      settings = {
        texlab = {
          auxDirectory = ".",
          bibtexFormatter = "texlab",
          build = {
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            executable = "latexmk",
            forwardSearchAfter = false,
            onSave = true,
          },
          chktex = {
            onEdit = false,
            onOpenAndSave = false,
          },
          diagnosticsDelay = 300,
          formatterLineLength = 80,
          forwardSearch = {
            args = {},
          },
        },
      },
    })
  end,
  ["pyright"] = function()
    lspconfig.pyright.setup({
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    })
  end,
})
