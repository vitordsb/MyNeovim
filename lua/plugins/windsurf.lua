return {
  {
    'Exafunction/codeium.vim',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set('i', '<C-a>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-;>', '<cmd>Codeium cycle_completions<CR>', { silent = true })
      vim.g.codeium_popup_window_position = 'inline'
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = {
      'CodeCompanion',
      'CodeCompanionActions',
      'CodeCompanionChat',
      'CodeCompanionCmd',
    },
    keys = {
      {
        '<leader>ai',
        function()
          vim.cmd 'CodeCompanionChat Toggle'
        end,
        mode = { 'n', 'v' },
        desc = 'Toggle AI chat',
      },
      {
        '<leader>aa',
        function()
          vim.cmd 'CodeCompanionActions'
        end,
        mode = { 'n', 'v' },
        desc = 'AI action palette',
      },
      {
        '<leader>ap',
        function()
          vim.cmd 'CodeCompanion'
        end,
        mode = { 'n', 'v' },
        desc = 'AI inline assistant',
      },
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'openai',
          model = 'gpt-4o-mini',
        },
        inline = {
          adapter = 'openai',
          model = 'gpt-4o-mini',
        },
        cmd = {
          adapter = 'openai',
          model = 'gpt-4o-mini',
        },
      },
    },
    config = function(_, opts)
      require('codecompanion').setup(opts)
    end,
  },
}
