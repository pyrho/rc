local M = {}
function M.setup_autocmd()
  vim.cmd [[
        augroup MyPackerAutocmd
            au!
            au BufWritePost */plugins/init.lua lua require 'pyrho.plugins.reload'.refresh_plugins()
        augroup END
    ]]
end

function M.refresh_plugins()
  for name, _ in pairs(package.loaded) do
    if name:match('^pyrho') then package.loaded[name] = nil end
  end

  dofile(vim.env.MYVIMRC)
  vim.cmd "PackerCompile"
end

return M
