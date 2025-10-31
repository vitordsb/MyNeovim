return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        always_show_bufferline = true,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        offsets = {
          {
            filetype = 'NvimTree',
            text = 'Explorer',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
        diagnostics_indicator = function(count, level)
          local icon = level:match 'error' and 'E ' or 'W '
          return icon .. count
        end,
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      vim.keymap.set('n', '<C-S-p>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer (breadcrumbs)' })
      vim.keymap.set('n', '<C-S-n>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer (breadcrumbs)' })
    end,
  },
}
