local M = {}

function M.config()
  require"lspsaga".init_lsp_saga()

  -- :/ This needs to be here
  require "astronauta.keymap"

  vim.keymap.nnoremap {'gh', require'lspsaga.provider'.lsp_finder}

  vim.keymap.nnoremap {'<Leader>ca', require('lspsaga.codeaction').code_action}

  vim.keymap.nnoremap {'K', require('lspsaga.hover').render_hover_doc}

  vim.keymap.nnoremap {
    '<C-f>', function() require('lspsaga.action').smart_scroll_with_saga(1) end
  }

  vim.keymap.nnoremap {
    '<C-b>', function() require('lspsaga.action').smart_scroll_with_saga(-1) end
  }

  vim.keymap.nnoremap {
    '<Leader>gd', require'lspsaga.provider'.preview_definition
  }

  vim.keymap.nnoremap {
    'cc', require'lspsaga.diagnostic'.show_cursor_diagnostics
  }

  vim.keymap.nnoremap {
    '[e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev
  }

  vim.keymap.nnoremap {
    ']e', require'lspsaga.diagnostic'.lsp_jump_diagnostic_next
  }

end

return M
