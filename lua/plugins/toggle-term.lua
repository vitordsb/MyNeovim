-- lua/plugins/init.lua
return {
  {
    'akinsho/toggleterm.nvim',
    version = 'v2.*',
    config = function()
      require('toggleterm').setup {
        size = 12,
        open_mapping = [[<c-j>]],
        direction = 'horizontal',
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
      }
    end,
  },
}
