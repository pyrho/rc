return {
  'azabiong/vim-highlighter',
  keys = {"f<CR>", "f<BS>"},
  cmd = { "Hi"},
  config = function()
      vim.g.HiSyncMode = 1
  end
}
