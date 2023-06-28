local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

local status_ok_1, lsp_notify = pcall(require, "lsp-notify")
if not status_ok_1 then
  return
end


lsp_notify.setup({
  notify = notify,
})
