local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

local config = {
  options = {
    indicator = { style = "underline" },
    diagnostics = "nvim_lsp",
    -- luacheck: no unused args
    ---@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or " ")
        s = s .. n .. sym
      end
      return s
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "NeoVim Tree",
        separator = false,
      },
    },
  },
}
bufferline.setup(config)
