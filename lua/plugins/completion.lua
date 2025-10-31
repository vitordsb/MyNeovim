return {
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    build = 'make install_jsregexp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.filetype_extend('javascript', { 'html' })
      luasnip.filetype_extend('javascriptreact', { 'javascript', 'html' })
      luasnip.filetype_extend('typescript', { 'javascript', 'html' })
      luasnip.filetype_extend('typescriptreact', { 'javascript', 'javascriptreact', 'html' })
    end,
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip' },
    opts = {
      keymap = { preset = 'super-tab' },
      completion = {
        documentation = { auto_show = false },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      snippets = { preset = 'luasnip' },
    },
    config = function(_, opts)
      require('blink.cmp').setup(opts)
    end,
    opts_extend = { 'sources.default' },
  },
}
