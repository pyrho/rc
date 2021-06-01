" Disabled because there are too many QoL issues for me
" No MRU sort on buffers for example
" nnoremap <silent> <Leader>o :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
" nnoremap <silent> <Leader>b :lua require'telescope.builtin'.buffers{sort_lastused=true, show_all_buffers=true}<cr>
" nnoremap <silent> <Leader>s :lua require'telescope.builtin'.live_grep()<cr>

lua <<EOF
require('telescope').setup {
  extensions = {
    fzf = {
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

EOF
