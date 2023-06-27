return {
  'azabiong/vim-highlighter',
  keys = {"<CR>", "<BS>"},
  cmd = { "Hi"},
  config = function()
      vim.g.HiSyncMode = 1
      vim.keymap.set("n", "<CR>", "<CMD>Hi +<CR>")
      vim.keymap.set("x", "<CR>", "<CMD>Hi +x<CR>")
      vim.keymap.set("n", "<BS>", "<CMD>Hi -<CR>")
      vim.keymap.set("x", "<BS>", "<CMD>Hi -x<CR>")
  end
}
