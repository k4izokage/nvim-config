local status, modicator = pcall(require, "modicator")
if not status then
    return
end

modicator.setup({
	show_warnings = false,
	highlights = {
		defaults = {
			bold = true,
			italic = true,
		},
		integration = {
			lualine = {
			  enabled = true,
			  -- Letter of lualine section to use (if `nil`, gets detected automatically)
			  mode_section = nil,
			  -- Whether to use lualine's mode highlight's foreground or background
			  highlight = 'bg',
			},
		  },
	},
})