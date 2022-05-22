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
    require"plenary.reload".reload_module("pyrho.plugins")
    require "pyrho.plugins"
    vim.cmd "PackerCompile"
end

return M
