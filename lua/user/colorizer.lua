local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

local default = {
  RGB      = true,
	RRGGBB   = true,
	names    = true,
	RRGGBBAA = false,
	rgb_fn   = false,
	hsl_fn   = false,
	css      = false,
	css_fn   = false,
	mode     = 'background',
}

colorizer.setup({"*"}, default)
