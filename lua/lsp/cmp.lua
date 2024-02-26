local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local status_ok_1, luasnip = pcall(require, "luasnip")
if not status_ok_1 then
  return
end

local M = {}

function M.luasnip_supertab(select_opts)
  return cmp.mapping(function(fallback)
    local col = vim.fn.col(".") - 1

    if cmp.visible() then
      cmp.select_next_item(select_opts)
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
      fallback()
    else
      cmp.complete()
    end
  end, { "i", "s" })
end

function M.luasnip_shift_supertab(select_opts)
  return cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item(select_opts)
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" })
end

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ["<Tab>"] = M.luasnip_supertab(),
    ["<S-Tab>"] = M.luasnip_shift_supertab(),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  },
})
