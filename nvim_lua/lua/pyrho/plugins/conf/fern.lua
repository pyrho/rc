local M = {}

function M.config()
  vim.api.nvim_set_keymap('n', '<Leader>f', ':Fern %:h -reveal=%<CR>',
                          {noremap = true})
  vim.g["fern#renderer"] = "nerdfont"

  vim.cmd [[
    augroup MyFernStuff
        au!
        autocmd FileType fern call glyph_palette#apply()
    augroup END
  ]]
end

return M
