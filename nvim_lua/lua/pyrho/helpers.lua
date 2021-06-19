local M = {}
local api = vim.api
-- From https://sbulav.github.io/vim/neovim-telescope-github/
function M.rewrite_wrap(fn)
  local windows = api.nvim_list_wins()
  local all_saves = {}

  local save_kthx = function(this_win_nr)
    local cursor = api.nvim_win_get_cursor(this_win_nr)
    all_saves[this_win_nr] = cursor
  end

  local restore_plzthx = function(this_win_nr)
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

function M.save_and_exec()
    vim.cmd [[ :silent! write ]]
    if vim.bo.filetype == "lua" then
        require "plenary.reload".reload_module "%"
    end
    vim.cmd [[ :source % ]]
end

function M.is_zen()
    return vim.env.NVIMZEN == "1"
end

function M.mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

return M
