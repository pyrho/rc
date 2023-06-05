local M = {}
local api = vim.api
function M.getFiletypesForLSP()
  return {"typescript", "typescriptreact", "javascript", "lua"}
end
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

  for i, v in ipairs(windows) do save_kthx(v) end

  fn()

  for i, v in ipairs(windows) do restore_plzthx(v) end
end

function M.save_and_exec()
  vim.cmd [[ :silent! write ]]
  if vim.bo.filetype == "lua" then require"plenary.reload".reload_module "%" end
  vim.cmd [[ :source % ]]
end

function M.is_zen() return vim.env.NVIMZEN == "1" end

function M.mysplit(inputstr, sep)
  if sep == nil then sep = "%s" end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

M.separators = {
  vertical_bar = '┃',
  vertical_bar_thin = '│',
  left = '',
  right = '',
  block = '█',
  left_filled = '',
  right_filled = '',
  slant_left = '',
  slant_left_thin = '',
  slant_right = '',
  slant_right_thin = '',
  slant_left_2 = '',
  slant_left_2_thin = '',
  slant_right_2 = '',
  slant_right_2_thin = '',
  left_rounded = '',
  left_rounded_thin = '',
  right_rounded = '',
  right_rounded_thin = '',
  circle = '●',
  github_icon = " ﯙ ",
  folder_icon = " ",
  ghost = ''
}

function _G.ReloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^pyrho') then package.loaded[name] = nil end
  end

  dofile(vim.env.MYVIMRC)
end



return M
