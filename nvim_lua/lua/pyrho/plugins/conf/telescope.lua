local M = {}
function M.config()
  require("telescope").setup {
    pickers = {
      -- Your special builtin config goes in here
      buffers = {sort_lastused = true, theme = "dropdown" },
      find_files = {theme = "dropdown"}
    }
  }

  vim.api.nvim_set_keymap("n", "<Leader>o",
                          "<cmd>lua require('telescope.builtin').find_files({ previewer=false, seach_dirs = { 'src' } })<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>s",
                          "<cmd>lua require('telescope.builtin').live_grep({ seach_dirs = { 'src' } })<CR>",
                          {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Telescope buffers<CR>",
                          {noremap = true, silent = true})
end
return M
