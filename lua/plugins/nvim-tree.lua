return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        view = {
          adaptive_size = true,
          width = 25,
          side = 'left',
        },
        git = {
          enable = true,
          ignore = false,
        },
        renderer = {
          root_folder_label = false,
          indent_width = 0,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
            },
          },
        },
        actions = {
          open_file = {
            resize_window = true,
          },
        },
        filters = {
          dotfiles = false,
          git_ignored = false,
          custom = {},
        },
      }
      vim.keymap.set('n', '<leader>b', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
    end,
  },
}
