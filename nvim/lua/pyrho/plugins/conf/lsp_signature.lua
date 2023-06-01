local M = {}

function M.config()

  local cfg = {
      fix_pos = true,
      floating_window = false
  }

  -- recommended:
  require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key
end

return M
