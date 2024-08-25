local M = {}

function M.set_custom_highlight(hl_group)
    for name, value in pairs(hl_group) do
      if type(value) == "table" then
        local fg_color = value[1]
        local bg_color = value[2]
        vim.api.nvim_set_hl(0, name, { fg = fg_color, bg = bg_color })
      else
        vim.api.nvim_set_hl(0, name, { fg = value })
      end
    end
end

return M