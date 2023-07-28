return {
  "lambdalisue/fern.vim",
  enabled = false,
  keys = {{"<LEADER>f", ":Fern . -reveal=%<CR>"}},
  config = function()
    -- vim.api.nvim_set_keymap('n', '<Leader>f', ':Fern . -reveal=%<CR>',
    -- {noremap = true, silent = true})
    vim.g["fern#renderer"] = "nerdfont"

    local fern_aug = vim.api.nvim_create_augroup('MyFernStuff', {clear = true})
    vim.api.nvim_create_autocmd({'FileType'}, {
      pattern = 'fern',
      group = fern_aug,
      command = 'call glyph_palette#apply()'
    })
    vim.api.nvim_create_autocmd({'FileType'}, {
      pattern = 'fern',
      group = fern_aug,
      callback = function()
        vim.api
            .nvim_buf_set_keymap(0, 'n', 'u', '<Plug>(fern-action-leave)', {})
        vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>bd<CR>', {})
      end
    })

  end,

  dependencies = {
    "lambdalisue/glyph-palette.vim", "lambdalisue/fern-git-status.vim",
    "lambdalisue/fern-hijack.vim", "lambdalisue/fern-renderer-nerdfont.vim",
    "lambdalisue/nerdfont.vim"
  }
}
