local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok1, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok1 then
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
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.offsetEncoding = { "utf-16" }

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
					"use",
					--AwesomeWm
					"awesome",
					"client",
					"root",
					"screen",
					"tag",
				},
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
