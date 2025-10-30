local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>r', ':%s/', opts)

map('n', '<leader>o', function()
  local path = vim.fn.expand '<cfile>'
  path = path:gsub('^@/', '')
  require('telescope.builtin').find_files {
    prompt_title = 'Go to import',
    default_text = path,
  }
end, opts)

map('n', '<Leader>e', function()
  vim.diagnostic.open_float(nil, { focus = false })
end)

-- Vertical split (abre nova janela à direita)
map('n', '<leader>t', ':vsplit<CR>', opts)
map('n', '<leader>q', ':close<CR>', opts)

-- Keymap para abrir a arvore de aquivos
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Keymap para aumentar e diminuir o tamanho da janela vertical
map('n', '<leader><Left>', ':vertical resize -5<CR>', opts)
map('n', '<leader><Right>', ':vertical resize +5<CR>', opts)

-- NORMAL mode: mover linha com reindentar e posicionar cursor
map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)

-- VISUAL mode: mover bloco mantendo seleção
map('x', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('x', '<A-k>', ":m '<-2<CR>gv=gv", opts)
