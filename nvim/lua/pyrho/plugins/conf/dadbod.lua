local M = {}

function M.config()
  vim.g.dbs = {dev = "mysql://root:root@127.0.0.1:8889/caribou"}
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_auto_execute_table_helpers = 1

  -- Execute via <leader>S
  vim.g.db_ui_execute_on_save = 0

  vim.g.db_ui_icons = {
    expanded = '▾',
    collapsed = '▸',
    saved_query = '*',
    new_query = '+',
    tables = '~',
    buffers = '»',
    connection_ok = '✓',
    connection_error = '✕'
  }


  -- From URL

  vim.cmd[[
  xnoremap <expr> <Plug>(DBExe)     db#op_exec()
nnoremap <expr> <Plug>(DBExe)     db#op_exec()
nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'

xmap <leader>db  <Plug>(DBExe)
nmap <leader>db  <Plug>(DBExe)
omap <leader>db  <Plug>(DBExe)
nmap <leader>dbb <Plug>(DBExeLine)
  ]]
end

return M
