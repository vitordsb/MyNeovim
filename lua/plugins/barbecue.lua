return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
    'neovim/nvim-lspconfig',
  },
  opts = function()
    local barbecue = require 'barbecue'
    return {
      show_modified = true,
      theme = 'auto',
      kinds = require('barbecue.config').kinds, -- <-- seguro agora
    }
  end,
}
