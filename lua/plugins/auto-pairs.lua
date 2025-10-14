return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true, -- usa Treesitter
      enable_check_bracket_line = true, -- evita pares duplicados
      map_cr = true, -- <CR> pula pro próximo par
      map_bs = true, -- backspace “inteligente”

      fast_wrap = {
        map = '<M-e>', -- Alt+e ativa o menu de wrap
        chars = { '{', '[', '(', '"', "'" },
        -- atenção nos delimitadores [[ ... ]] e no fechamento do gsub:
        pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], ' ', ''),
        end_key = '$',
        keys = 'qwertyuiopasdfghjklzxcvbnm',
        check_comma = true,
        highlight = 'PmenuSel',
        highlight_grey = 'LineNr',
      },

      disable_filetype = { 'TelescopePrompt', 'vim', 'text' },
      ignored_next_char = '[%w%.]',
      enable_moveright = true,
      enable_afterquote = true,
    },

    config = function(_, opts)
      require('nvim-autopairs').setup(opts)

      -- integração com nvim-cmp (se existir)
      local has_cmp, cmp = pcall(require, 'cmp')
      if has_cmp then
        local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
      end
    end,
  },
}
