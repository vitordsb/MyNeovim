return {
  'Exafunction/codeium.vim',
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set('i', '<C-a>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<C-;>', '<cmd>Codeium cycle_completions<CR>', { silent = true })
    vim.g.codeium_popup_window_position = 'inline'
  end,
}
