return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.opt.list = true

    require('ibl').setup {
      indent = {
        char = '│',
        tab_char = '│',
        highlight = { 'Whitespace' }, -- usa a cor que o tema define para espaços
      },
      scope = {
        enabled = true,
        show_start = true,
        char = '│',
        highlight = { 'Function' }, -- pega uma cor de destaque do tema
      },
      exclude = {
        filetypes = { 'alpha', 'lazy', 'mason', 'toggleterm', 'help', 'neo-tree', 'Trouble' },
        buftypes = { 'terminal', 'nofile' },
      },
    }
  end,
}
