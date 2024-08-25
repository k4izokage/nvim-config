return {
    -- Simple winbar/statusline plugin that shows your current code context
    {
      'SmiteshP/nvim-navic',
      event = "VeryLazy",
      config = function()
        require('plugins.configs.navic')
      end,
    },
}
  
  