local M = {}

function M.init()
  -- Movement
  vim.api.nvim_set_keymap("n", "<Leader>h", ":wincmd h<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>j", ":wincmd j<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>k", ":wincmd k<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>l", ":wincmd l<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>w", ":wa<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader><Leader>x",
                          "<cmd>lua require'pyrho.helpers'.save_and_exec()<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Localleader>k",
                          "<cmd>.!toilet -w80 -f pagga -F border<CR>Vjjjj:center<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("i", "jf", "<Esc>", {noremap = true})
  vim.api.nvim_set_keymap("i", "fj", "<Esc>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<Leader>w<Leader>w", "<cmd>e ~/Dropbox/diary/`date +\\%Y-\\%m-\\%d`.md<CR>", {noremap = true})

end
return M
