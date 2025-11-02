
return {
  {
    'akinsho/toggleterm.nvim',
    version = 'v2.*',
    config = function()
      require('toggleterm').setup {
        size = 12,
        open_mapping = [[<c-j>]], -- atalho principal
        direction = 'float',      -- 🧠 padrão agora é float
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        persist_mode = true,
        float_opts = {
          border = 'curved',      -- bordas arredondadas estilo pop-up
          width = math.floor(vim.o.columns * 0.9),
          height = math.floor(vim.o.lines * 0.85),
          winblend = 5,           -- leve transparência (0–100)
        },
      }

      -- Atalho alternativo para abrir um novo float terminal
      vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { desc = "Abrir terminal flutuante" })
    end,
  },
}

