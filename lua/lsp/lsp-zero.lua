local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then
  return
end

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

lsp_zero.preset("recommended")

mason.setup({})
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "bashls",
    "cssls",
  },
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      lspconfig.lua_ls.setup(lua_opts)
    end,
  },
})

lsp_zero.on_attach(function(client, bufnr) -- luacheck: no unused args
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_sign_icons({ error = " ", warn = " ", hint = " ", info = " " })

vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
  },
})

local status_ok_4, lsp_signature = pcall(require, "lsp_signature")
if not status_ok_4 then
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
local status_ok_5, null_ls = pcall(require, "null-ls")
if not status_ok_5 then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  on_attach = function(client, bufnr)
    local bufcmd = vim.api.nvim_buf_create_user_command

    bufcmd(bufnr, "NullFormat", function()
      vim.lsp.buf.format({
        id = client.id,
        timeout_ms = 10000,
      })
    end, {})
  end,
  sources = {
    formatting.stylua,
    formatting.black,
    formatting.shfmt,
    formatting.prettier.with({
      filetypes = {"javascript", "html", "json", "yaml", "markdown"}
    }),
    formatting.stylelint,
  },
})

-- CMP Config
local status_ok_6, cmp = pcall(require, "cmp")
if not status_ok_6 then
  return
end

local cmp_format = lsp_zero.cmp_format()

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
  formatting = cmp_format,
})

lsp_zero.setup()
