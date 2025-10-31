return {
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'html',
      'javascriptreact',
      'typescriptreact',
      'vue',
      'svelte',
      'tsx',
    },
    opts = {},
  },
  {
    'mattn/emmet-vim',
    ft = {
      'html',
      'css',
      'scss',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
    init = function()
      vim.g.user_emmet_settings = {
        javascript = {
          extends = 'jsx',
        },
        typescript = {
          extends = 'tsx',
        },
      }
    end,
  },
}
