return {
    -- A snazzy buffer line (with tabpage integration) 
    {
        'akinsho/bufferline.nvim', 
        event = 'BufRead',
        config = function()
            require('plugins.configs.bufferline')
        end,
    },
}