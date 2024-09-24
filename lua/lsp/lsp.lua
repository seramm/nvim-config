local status_ok_1, mason = pcall(require, "mason")
if not status_ok_1 then
  return
end

local status_ok_2, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_2 then
  return
end

local status_ok_3, lspconfig = pcall(require, "lspconfig")
if not status_ok_3 then
  return
end

local status_ok_4, lsp_signature = pcall(require, "lsp_signature")
if not status_ok_4 then
  return
end

local status_ok_5, lsp_lines = pcall(require, "lsp_lines")
if not status_ok_5 then
  return
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
    vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
    vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
    vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  end,
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "bashls",
    "cssls",
    "ts_ls",
  },
  handlers = {
    default_setup,
    ts_ls = function()
      lspconfig.ts_ls.setup({
        capabilities = lsp_capabilities,
        cmd = { "typescript-language-server", "--stdio" },
      })
    end,
  },
})

lsp_lines.setup()

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
})

local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
for name, icon in pairs(signs) do
  name = "DiagnosticSign" .. name
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end

lsp_signature.setup({
  on_attach = function(client, bufnr) -- luacheck: no unused args
    lsp_signature.on_attach({
      bind = true, -- This is mandatory, otherwise border config won't get registered.
      handler_opts = {
        border = "rounded",
      },
    }, bufnr)
  end,
})
