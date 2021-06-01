local M = {fns = {}}

local api = vim.api
local nvim_buf_set_keymap = api.nvim_buf_set_keymap
local vcmd = vim.cmd
local vfn = vim.fn

local function register_cb(fn)
  local id = tostring(fn)
  M.fns[id] = fn
  return id
end

function M.cmd_map(cmd)
  return string.format('<cmd>%s<cr>', cmd)
end

function M.vcmd_map(cmd)
  return string.format([[<cmd>'<,'>%s<cr>]], cmd)
end

function M.fn_cmd(fn)
  local id = register_cb(fn)
  return string.format([[lua require('fsouza.lib.nvim_helpers').fns['%s']()]], id)
end

function M.fn_map(fn)
  return M.cmd_map(M.fn_cmd(fn))
end

function M.vfn_map(fn)
  return M.vcmd_map(M.fn_cmd(fn))
end

function M.ifn_map(fn)
  local id = register_cb(fn)
  return string.format([[<c-r>=luaeval("require('fsouza.lib.nvim_helpers').fns['%s']()")<CR>]], id)
end

function M.create_mappings(mappings, bufnr)
  local fn = api.nvim_set_keymap
  if bufnr then
    fn = function(...)
      nvim_buf_set_keymap(bufnr, ...)
    end
  end

  for mode, rules in pairs(mappings) do
    for _, m in ipairs(rules) do
      fn(mode, m.lhs, m.rhs, m.opts or {})
    end
  end
end

function M.exec_cmds(cmd_list)
  vcmd(table.concat(cmd_list, '\n'))
end

function M.augroup(name, commands)
  vcmd('augroup ' .. name)
  vcmd('autocmd!')
  for _, c in ipairs(commands) do
    vcmd(string.format('autocmd %s %s %s %s', table.concat(c.events, ','),
                       table.concat(c.targets or {}, ','), table.concat(c.modifiers or {}, ' '),
                       c.command))
  end
  vcmd('augroup END')
end

function M.ensure_path_relative_to_prefix(prefix, path)
  if not vim.endswith(prefix, '/') then
    prefix = prefix .. '/'
  end
  if vim.startswith(path, prefix) then
    return string.sub(path, string.len(prefix) + 1)
  end
  return path
end

function M.rewrite_wrap(fn)
  local windows = api.nvim_list_wins()
  local all_saves = {}

  local save_kthx = function(this_win_nr)
    local cursor = api.nvim_win_get_cursor(this_win_nr)
    all_saves[this_win_nr] = cursor
  end

  local restore_plzthx = function(this_win_nr)
    print(vim.inspect(all_saves))
    api.nvim_win_set_cursor(this_win_nr, all_saves[this_win_nr])
  end

  for i,v in ipairs(windows) do 
      save_kthx(v)
  end

  fn()

  for i,v in ipairs(windows) do 
      restore_plzthx(v)
  end
end

return M
