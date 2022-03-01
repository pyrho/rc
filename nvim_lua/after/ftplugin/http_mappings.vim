lua << EOF
  vim.api.nvim_set_keymap("n", "<localleader>r", "<Plug>RestNvim<CR>", {})
  vim.api.nvim_set_keymap("n", "<localleader>p", "<Plug>RestNvimPreview<CR>", {})
  vim.api.nvim_set_keymap("n", "<localleader>l", "<Plug>RstNvimLast<CR>", {})
EOF

