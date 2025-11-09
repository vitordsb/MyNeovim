
return {
  {
    'akinsho/toggleterm.nvim',
    version = 'v2.*',
    config = function()
      require('toggleterm').setup {
        size = 15,
        open_mapping = [[<c-j>]], -- atalho principal
        direction = 'horizontal',      -- 🧠 padrão agora é float
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        persist_mode = true,
      }
    end,
  },
}

