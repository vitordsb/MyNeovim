return {
  'kndndrj/nvim-dbee',
  dependencies = { 'MunifTanjim/nui.nvim' },
  build = function()
    require('dbee').install() -- ✅ baixa e compila o backend automaticamente
  end,
  config = function()
    require('dbee').setup {
      sources = {
        require('dbee.sources').MemorySource:new {
          {
            id = 'mysql-local',
            name = 'MySQL Local',
            type = 'mysql',
            url = 'root:senha@tcp(127.0.0.1:3306)/nome_do_banco',
          },
        },
      },
    }
  end,
}
