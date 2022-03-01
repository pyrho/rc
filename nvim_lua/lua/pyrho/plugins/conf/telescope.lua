local M = {}
function M.config()
  require("telescope").setup {
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
    },
    pickers = {
      -- Your special builtin config goes in here
      buffers = {sort_mru = true, sort_lastused = true, theme = "dropdown"},
      find_files = {theme = "dropdown"}
    }
  }
  vim.api.nvim_set_keymap("n", "g0", "<cmd>Telescope lsp_document_symbols<CR>",
                          {noremap = true, silent = true})

  require('telescope').load_extension('fzf')
  -- @NOTE
  --  Why?
  --  Because the API is poorly documented.
  --  Because live grep is not fuzzy
  --  Because sorting buffers by last used is not working (recently fixed)
  --    - dr, 2021-07-26
  --[[ vim.api.nvim_set_keymap("n", "<Leader>o",
                          "<cmd>lua require('telescope.builtin').find_files({ previewer=false })<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>s",
                          "<cmd>lua require('telescope.builtin').live_grep({ use_regex = true })<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>S",
                          "<cmd>lua require('telescope.builtin').live_grep({ use_regex = true, cwd = 'src'  })<CR>",
                          {noremap = true, silent = true})

  vim.api.nvim_set_keymap("n", "<Leader>b", "<cmd>Telescope buffers<CR>",
                          {noremap = true, silent = true})

   ]]
end
return M
