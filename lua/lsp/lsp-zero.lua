local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  return
end

lsp_zero.preset("recommended")

lsp_zero.ensure_installed({
  "lua_ls",
  "pyright",
})

lsp_zero.on_attach(function(client, bufnr) -- luacheck: no unused args
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.format_mapping("gf", {
  servers = {
    ["null-ls"] = { "lua", "python" },
  },
})

lsp_zero.set_sign_icons({ error = " ", warn = " ", hint = " ", info = " " })

lsp_zero.setup()

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
})

local status_ok_1, lsp_signature = pcall(require, "lsp_signature")
if not status_ok_1 then
  return
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

-- Null-ls Config
local status_ok_3, null_ls = pcall(require, "null-ls")
if not status_ok_3 then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    formatting.stylua,
    formatting.black,
  },
})

-- CMP Config
local status_ok_2, cmp = pcall(require, "cmp")
if not status_ok_2 then
  return
end

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<Tab>"] = lsp_zero.cmp_action().luasnip_supertab(),
    ["<S-Tab>"] = lsp_zero.cmp_action().luasnip_shift_supertab(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = require("lspkind").cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
    }),
  },
})
