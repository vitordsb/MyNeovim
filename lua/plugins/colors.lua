return {
  -- Color preview (igual ao VSCode)
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        '*', -- aplica em todos os arquivos
        css = { rgb_fn = true, hsl_fn = true, names = true },
        html = { names = true },
      }
    end,
  },

  -- Color picker interativo (abrir com :CccPick)
  {
    'uga-rosa/ccc.nvim',
    config = function()
      local ccc = require 'ccc'
      ccc.setup {
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
        pickers = {
          default = 'color_picker',
        },
      }

      -- atalho prático: <leader>cp para abrir o seletor de cores
      vim.keymap.set('n', '<leader>cp', '<cmd>CccPick<CR>', { desc = 'Abrir Color Picker' })
    end,
  },
}
