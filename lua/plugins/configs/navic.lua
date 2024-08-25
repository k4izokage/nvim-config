local status, navic = pcall(require, "nvim-navic")
if not status then
    return
end

navic.setup {
  icons = require("utils.icons").kinds,
  highlight = true,
  lsp = {
    auto_attach = true,
    preference = nil,
  },
  depth_limit = 0,
  depth_limit_indicator = "..",
  safe_output = true,
  lazy_update_context = false,
  click = true,
}