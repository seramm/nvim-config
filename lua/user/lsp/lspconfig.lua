local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

local on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "jump to definition"})
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})

  if client.server_capabilities.documentFormattingProvider then
    map("n", "<leader>f", vim.lsp.buf.format, {desc = "format code"})
  end
end
