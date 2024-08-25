local autocmd = vim.api.nvim_create_autocmd

-- Apply new custom highlights, override hl_group
local hlgroup = require("utils.highlights")

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    require("utils").set_custom_highlight(hlgroup.alpha_plugin)
  end
})