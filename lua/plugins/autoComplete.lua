return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    opts = {
      keymap = {
        preset = 'none',

        -- abrir/forçar o menu
        ['<C-Space>'] = { 'show' },

        -- aceitar a sugestão (com fallback para inserir Tab se não houver menu)
        ['<Tab>'] = { 'accept', 'fallback' },

        -- navegação
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next' },
        ['<C-p>'] = { 'select_prev' },

        -- fechar / docs
        ['<C-e>'] = { 'hide' },
        ['<C-f>'] = { 'scroll_documentation_down' },
        ['<C-b>'] = { 'scroll_documentation_up' },
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        trigger = { show_on_insert = true },
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
}
