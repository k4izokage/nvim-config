local opt = vim.opt
local get_hl = vim.api.nvim_get_hl
local set_hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd
--------------------------------------------------
-- Apply new custom highlights, override hl_group
local hlgroup = require("utils.highlights")

autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    require("utils").set_custom_highlight(hlgroup.alpha_plugin)
  end
})
--------------------------------------------------
-- Hide cursor for Alpha dashboard
autocmd('User', {
  pattern = 'AlphaReady',
  callback = function()
    -- Get current Cursor highlight group
    local cursor_hl = get_hl(0, {name = 'Cursor', link = false})
    -- Set blend to 100 to hide the cursor
    cursor_hl.blend = 100
    set_hl(0, 'Cursor', cursor_hl)
    -- Append custom guicursor setting
    opt.guicursor:append('a:Cursor/lCursor')
  end,
})

-- Restore cursor after leaving Alpha dashboard
autocmd('BufUnload', {
  buffer = 0,
  callback = function()
    -- Reset the Cursor highlight group
    local cursor_hl = get_hl(0, {name = 'Cursor', link = false})
    cursor_hl.blend = 0
    set_hl(0, 'Cursor', cursor_hl)
    -- Remove custom guicursor setting
    opt.guicursor:remove('a:Cursor/lCursor')
  end,
})
