local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok1, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok1 then
  return
end


local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

  if client.server_capabilities.documentFormattingProvider then
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {desc = "format code"})
  end
end
local capabilities = cmp_nvim_lsp.default_capabilities()

nvim_lsp.lua_ls.setup({
  capabilities = capabilities,
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

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
