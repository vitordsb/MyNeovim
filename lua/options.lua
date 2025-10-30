vim.cmd [[filetype plugin indent on]] -- habilita detecção de filetype
local o = vim.opt -- opções globais
o.number = true -- mostra número da linha
o.relativenumber = true -- mostra números relativos
o.cursorline = true -- destaca linha atual
o.expandtab = true -- usa espaços em vez de tabs
o.wrap = true
o.linebreak = true
o.display = 'lastline'
o.shiftwidth = 2 -- número de espaços ao indentar
o.softtabstop = 2 -- tabulações “virtuais” ao inserir
o.tabstop = 2 -- largura de tab para arquivos
o.ignorecase = true -- pesquisa case-insensitive...
o.smartcase = true -- ...exceto se conter maiúsculas
o.fileencoding = 'utf-8' -- encoding=utf-8
o.mouse = 'a'
o.hlsearch = true -- destaca resultados da busca
o.incsearch = true -- busca incremental
o.swapfile = false -- desabilita swap files
o.backup = false -- desabilita backups
o.undofile = true -- habilita histórico de undo
o.wrap = true -- não quebra linhas automaticamente
o.linebreak = true -- quebra em palavras
o.termguicolors = true
o.breakindentopt = 'shift:2,min:20' -- opcional, desloca 2 espaços no mínimo
o.cmdheight = 0
o.breakindent = true -- herda indent da linha original
o.hidden = true -- permite mudar de buffer sem salvar
o.equalalways = false -- impede que splits se reajustem sempre
o.scrolloff = 0
o.backupskip = '/tmp/*,/private/tmp/*' -- evita backup em diretórios temporários
o.laststatus = 1 -- desliga barra de status
o.scrolloff = 6 -- mantém 8 linhas de margem ao rolar
o.updatetime = 200 -- tempo de atualização (ms) p/ CursorHold e swap
o.clipboard = 'unnamedplus' -- usa clipboard do sistema
o.completeopt = 'menu,menuone,noselect' -- melhor UX p/ LSP/completes
o.virtualedit = 'block'
o.fillchars = 'eob: '

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove { 'r', 'o' }
  end,
})
