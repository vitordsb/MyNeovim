return {
  {
    'sainnhe/everforest',
    priority = 1000,
    config = function()
      vim.o.background = 'dark'
      vim.g.everforest_background = 'hard'
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_enable_italic_comment = 1
      vim.g.everforest_better_performance = 1
      vim.cmd 'colorscheme everforest'
    end,
  },
}
