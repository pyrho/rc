return {
  'lewis6991/hover.nvim',
  event = 'VeryLazy',
  config = function()
    local LSPWithDiagSource = {
      name = "LSP",
      priority = 1000,
      enabled = function() return true end,
      execute = function(done)
        local util = require("vim.lsp.util")

        local params = util.make_position_params()
        ---@type table<string>
        local lines = {}
        vim.lsp.buf_request_all(0, "textDocument/hover", params,
                                function(responses)
          -- vim.notify("responses for hover request " .. vim.inspect(responses))
          local lang = "markdown"
          for _, response in pairs(responses) do
            if response.result and response.result.contents then
              lang = response.result.contents.language or "markdown"
              lines = util.convert_input_to_markdown_lines(response.result
                                                               .contents or
                                                               {
                    kind = "markdown",
                    value = ""
                  })
              lines = util.trim_empty_lines(lines or {})
            end
          end

          local unused
          local _, row = unpack(vim.fn.getpos("."))
          row = row - 1
          -- vim.notify("row " .. row)
          ---@type Diagnostic[]
          local lineDiag = vim.diagnostic.get(0, {lnum = row})
          -- vim.notify("curently " .. #lineDiag .. " diagnostics")
          local diag = require("vim.diagnostic")
          local diagnostic_severities = {
            [diag.severity.ERROR] = "ERROR",
            [diag.severity.WARN] = "WARN",
            [diag.severity.INFO] = "INFO",
            [diag.severity.HINT] = "HINT"
          }
          if #lineDiag > 0 then
            for _, d in pairs(lineDiag) do
              if d.message then
                lines = util.trim_empty_lines(
                            util.convert_input_to_markdown_lines({
                      language = lang,
                      value = string.format("[%s] - %s:%s", d.source,
                                            diagnostic_severities[d.severity],
                                            d.message)
                    }, lines or {}))
              end
            end
          end
          for _, l in pairs(lines) do l = l:gsub("\r", "") end

          if not vim.tbl_isempty(lines) then
            done({lines = lines, filetype = "markdown"})
            return
          end
          -- no results
          done()
        end)
      end
    }
    require("hover").setup {
      init = function()
        -- Require providers
        -- require("hover.providers.lsp")
        require("hover").register(LSPWithDiagSource)
        -- require('hover.providers.gh')
        -- require('hover.providers.gh_user')
        -- require('hover.providers.jira')
        -- require('hover.providers.man')
        -- require('hover.providers.dictionary')
      end,
      preview_opts = {border = nil},
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = false,
      title = true
    }

    -- Setup keymaps
    vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    vim.keymap.set("n", "gK", require("hover").hover_select,
                   {desc = "hover.nvim (select)"})
  end
}
