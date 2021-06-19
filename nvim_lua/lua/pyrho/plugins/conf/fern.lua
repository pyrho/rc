local M = {}

function M.mappings()
  vim.keymap.nnoremap {'q', '<Plug>(fern-action-cancel)', buffer = true}
end

function M.config()
  vim.api.nvim_set_keymap('n', '<Leader>f', ':Fern . -reveal=%<CR>', { noremap = true })

  vim.cmd [[
    augroup MyFernMaps
        au!
        au FileType fern lua require"pyrho.plugins.conf.fern".mappings()
    augroup END
  ]]
end

return M
