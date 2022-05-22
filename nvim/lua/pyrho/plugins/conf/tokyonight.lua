local M = {}
function M.config()
  if require"pyrho.helpers".is_zen() then
    vim.o.background = "light"
  else
    vim.o.background = "dark"
  end

  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_italic_functions = 0
  vim.g.tokyonight_italic_keywords = 0
  vim.g.tokyonight_italic_variables = 0
  vim.g.tokyonight_sidebars = {
    "qf", "vista_kind",
    -- Can't have this and the nice neovim logo in Dashboard
    --[["terminal"]]
    "packer", "defx", "lspsagafinder","fern"
  }
  vim.g.tokyonight_hide_inactive_statusline = true
  vim.cmd [[ colorscheme tokyonight ]]
end
return M
