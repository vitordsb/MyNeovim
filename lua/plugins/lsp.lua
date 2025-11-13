
return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },
    config = function()
      -- Inicializa Mason apenas uma vez
      require('mason').setup()

      -- LSP CONFIG attach
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnósticos e UI
      vim.diagnostic.config {
        update_in_insert = true,
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
        },
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local servers = {
        lua_ls = { settings = { Lua = { completion = { callSnippet = 'Replace' } } } },
        html = {},
        cssls = {},
        tailwindcss = {},
        jsonls = {},
        pyright = {},
        ts_ls = {},
        marksman = {},
        yamlls = {},
        bashls = {},
        dockerls = {},
        eslint = {},
        jdtls = {},
        emmet_language_server = {
          filetypes = { 'css', 'html', 'javascriptreact', 'typescriptreact', 'scss' },
        },
      }

      -- 🔧 Instalação fixa e persistente
      require('mason-tool-installer').setup {
        ensure_installed = {
          -- LSP servers
          'lua-language-server',
          'html-lsp',
          'css-lsp',
          'tailwindcss-language-server',
          'json-lsp',
          'pyright',
          'jdtls',
          'yaml-language-server',
          'bash-language-server',
          'dockerfile-language-server',
          'eslint-lsp',
          'emmet-language-server',
          'marksman',
          -- Formatters / Linters
          'stylua',
          'prettierd',
          'eslint_d',
          'typescript-language-server',
        },
        auto_update = false, -- ⛔ evita re-downloads
        run_on_start = true, -- garante instalações antes de abrir arquivos
        start_delay = 2000,
      }

      require('mason-lspconfig').setup {
        ensure_installed = vim.tbl_keys(servers),
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
  {
    'chikko80/error-lens.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      auto_adjust = {
        enable = true,
        fallback_bg_color = '#1e1e2e',
        step = 5,
        total = 30,
      },
      prefix = 3,
    },
    config = function(_, opts)
      require('error-lens').setup(opts)
    end,
  },
}
