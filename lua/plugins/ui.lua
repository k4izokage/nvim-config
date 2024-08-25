return {
    -- A snazzy buffer line (with tabpage integration) 
    {
        'akinsho/bufferline.nvim', 
        event = 'BufRead',
        config = function()
            require('plugins.configs.bufferline')
        end,
    },
    
    -- Status bar
    {
        "nvim-lualine/lualine.nvim", 
        event = "BufEnter",
        config = function()
            require('plugins.configs.lualine')
        end,
    },

    -- Cursor line number mode indicator
    {
        'mawkler/modicator.nvim',
        event = "BufEnter",
        config = function()
          require('plugins.configs.modicator')
        end,
    },

    -- Dashboard
    {
        'goolord/alpha-nvim',
        event = "VimEnter",
        config = function()
          require('plugins.configs.alpha')
        end,
    },
}