local M = {}

function M.mappings()
  vim.api.nvim_buf_set_keymap(0, 'n', 'u', '<Plug>(fern-action-leave)', {})
  vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>bd<CR>', {})
  -- vim.cmd [[
  --   nmap u <Plug>(fern-action-leave)
  --   ]]
end

function M.config()
  vim.api.nvim_set_keymap('n', '<Leader>f', ':Fern . -reveal=%<CR>',
                          {noremap = true, silent = true})
  vim.g["fern#renderer"] = "nerdfont"

  vim.cmd [[
    augroup MyFernStuff
        au!
        autocmd FileType fern call glyph_palette#apply()
        autocmd FileType fern :lua require"pyrho.plugins.conf.fern".mappings()
    augroup END
  ]]
end

return M
