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
      local mapping = require 'ccc.mapping'
      ccc.setup {
        bar_len = 42,
        win_opts = {
          border = 'rounded',
          relative = 'cursor',
          row = 1,
          col = 2,
          title = 'Clique para escolher a cor',
          title_pos = 'center',
        },
        highlighter = {
          auto_enable = true,
          lsp = true,
          update_insert = true,
          filetypes = { 'css', 'scss', 'sass', 'html', 'javascript', 'typescript', 'lua' },
        },
        mappings = {
          ['<LeftMouse>'] = mapping.click,
          ['<ScrollWheelUp>'] = mapping.increase5,
          ['<ScrollWheelDown>'] = mapping.decrease5,
        },
      }

      -- atalho prático: <leader>cp para abrir o seletor de cores
      vim.keymap.set('n', '<leader>cp', '<cmd>CccPick<CR>', { desc = 'Abrir Color Picker' })
    end,
  },
}
