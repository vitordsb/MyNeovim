return {
  {
    'Exafunction/codeium.vim',
    event = 'InsertEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_idle_delay = 500
      vim.g.codeium_popup_window_position = 'inline'

      local line_limit = 20

      local function clamp_text(text, remaining)
        if type(text) ~= 'string' or text == '' then
          return text, remaining
        end
        if remaining <= 0 then
          return '', 0
        end

        local segments = vim.split(text, '\n', { plain = true, trimempty = false })
        if #segments <= remaining then
          return text, remaining - #segments
        end

        local trimmed = {}
        for i = 1, remaining do
          trimmed[i] = segments[i]
        end

        return table.concat(trimmed, '\n'), 0
      end

      local function trim_completion(item)
        if type(item) ~= 'table' then
          return
        end

        local remaining = line_limit
        if type(item.completion) == 'table' then
          local text
          text, remaining = clamp_text(item.completion.text, remaining)
          item.completion.text = text
        end

        if type(item.suffix) == 'table' then
          local suffix_text
          suffix_text, remaining = clamp_text(item.suffix.text, remaining)
          item.suffix.text = suffix_text
        end

        if type(item.completionParts) ~= 'table' then
          return
        end

        local parts_remaining = line_limit
        for _, part in ipairs(item.completionParts) do
          if type(part) == 'table' then
            local text
            text, parts_remaining = clamp_text(part.text, parts_remaining)
            part.text = text
          end
        end
      end

      local limiter = vim.api.nvim_create_augroup('CodeiumLineLimiter', { clear = true })
      vim.api.nvim_create_autocmd({ 'InsertEnter', 'TextChangedI', 'CursorMovedI', 'CompleteChanged' }, {
        group = limiter,
        desc = 'Garante no máximo 20 linhas por sugestão do Codeium',
        callback = function()
          local state = vim.b._codeium_completions
          if type(state) ~= 'table' or type(state.items) ~= 'table' then
            return
          end
          for _, item in ipairs(state.items) do
            trim_completion(item)
          end
        end,
      })

      vim.keymap.set('i', '<C-a>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true, desc = 'Aceitar sugestão do Codeium' })

      vim.keymap.set('i', '<C-;>', '<Plug>(codeium-next-or-complete)', { silent = true, desc = 'Próxima sugestão do Codeium' })
    end,
  },
}
