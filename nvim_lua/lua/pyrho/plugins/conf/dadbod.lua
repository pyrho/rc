local M = {}

function M.config()
  vim.g.dbs = {dev = "mysql://root:root@127.0.0.1:8889"}
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_auto_execute_table_helpers = 1
  vim.g.db_ui_execute_on_save = 0
end

return M
