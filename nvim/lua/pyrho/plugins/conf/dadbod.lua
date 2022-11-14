local M = {}

function M.config()
  vim.g.dbs = {dev = "mysql://root:root@127.0.0.1:8889"}
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
  let g:dadbods = []
let db = {
		\"name": "Test Postgres DB",
		\"url": "postgresql://postgres:@localhost/postgres"
		\}

call add(g:dadbods, db)

let db = {
		\"name": "DEV Stage",
		\"url": "postgresql://stage_user:dummypassword@test.example.com/stage"
		\}

call add(g:dadbods, db)

let db = {
		\"name": "DEV Main",
		\"url": "postgresql://main_user:dummypassword@test.example.com/main"
		\}

call add(g:dadbods, db)

" if g:db and b:db is set up -- b:db will be used.
" so g:db would serve as a default database (first in the list)
let g:db = g:dadbods[0].url
  ]]

  vim.cmd [[ 
  command! DBSelect :call popup(map(copy(g:dadbods), {k,v -> v.name}), {
			\"callback": 'DBSelected'
			\})

func! DBSelected(id, result)
	if a:result != -1
		let b:db = g:dadbods[a:result-1].url
		echomsg 'DB ' . g:dadbods[a:result-1].name . ' is selected.'
	endif
endfunc
  ]]

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
