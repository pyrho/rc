nnoremap <silent> <Leader>o :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 10 }))<cr>
nnoremap <silent> <Leader>b :lua require'telescope.builtin'.buffers{show_all_buffers = true}<cr>
nnoremap <silent> <Leader>s :lua require'telescope.builtin'.live_grep{}<cr>

