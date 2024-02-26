local status_ok_5, null_ls = pcall(require, "null-ls")
if not status_ok_5 then
  return
end

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

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
      filetypes = {
        "html",
        "json",
        "yaml",
        "markdown",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
      },
    }),
    formatting.stylelint,
    code_actions.eslint,
  },
})


