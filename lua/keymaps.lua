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

-- Mantém o último yank disponível mesmo que o clipboard do sistema mude
local last_yank = { contents = nil, regtype = 'v', active = false }

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    local event = vim.v.event or {}
    if event.operator == 'y' then
      last_yank.contents = vim.deepcopy(event.regcontents or {})
      last_yank.regtype = event.regtype or 'v'
      last_yank.active = true
    elseif event.operator == 'd' or event.operator == 'c' then
      last_yank.active = false
    end
  end,
})

local function persistent_paste(cmd)
  return function()
    local count = vim.v.count > 0 and tostring(vim.v.count) or ''
    local register = vim.v.register
    if register and register ~= '' then
      vim.cmd.normal { string.format('%s"%s%s', count, register, cmd), bang = true }
      return
    end
    if last_yank.active and last_yank.contents and #last_yank.contents > 0 then
      vim.fn.setreg('0', vim.deepcopy(last_yank.contents), last_yank.regtype)
      vim.cmd.normal { string.format('%s"0%s', count, cmd), bang = true }
    else
      vim.cmd.normal { count .. cmd, bang = true }
    end
  end
end

map('n', 'p', persistent_paste('p'), { noremap = true, silent = true, desc = 'Colar mantendo último yank' })
map('n', 'P', persistent_paste('P'), { noremap = true, silent = true, desc = 'Colar antes mantendo último yank' })
