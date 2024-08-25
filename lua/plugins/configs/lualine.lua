local status, lualine = pcall(require, "lualine")
if not status then
    return
end

---------- Variables and Functions ----------
local icons = require("utils.icons")
local navic = require("nvim-navic")

-- Hide sections as the window width decreases to save space for necessary sections.
local function min_window_width(width)
  return function() return vim.fn.winwidth(0) > width end
end

---------- Components ----------
local diagnostics = {
	"diagnostics",
	sources = { "nvim_lsp" },
	sections = { "error", "warn" },
	symbols = { error = icons.diagnostics.error, warn = icons.diagnostics.warn},
	always_visible = false,
}

local filename = { "filename", cond = min_window_width(55) }

local branch = { "branch", cond = min_window_width(60) }

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end
local diff = {
	"diff",
	symbols = { 
    added = icons.git.added, 
    modified = icons.git.modified,
    removed =icons.git.removed
  },
  source = diff_source,
  cond = min_window_width(40)
}

local encoding = { "encoding", cond = min_window_width(80) }

local filetype = { "filetype", cond = min_window_width(80) }

---------- Setup ----------
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {"toggleterm", "alpha", "NvimTree", "neo-tree"},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {diagnostics},
    lualine_c = {filename},
    lualine_x = {branch, diff},
    lualine_y = {encoding, filetype},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_z = {'location'}
  },
  tabline = {},
  winbar = {
    lualine_c = {
      {
        function()
          return navic.get_location()
        end,
        cond = function()
          return navic.is_available()
        end
      },
    },
  },
  inactive_winbar = {},
  extensions = {}
}