augroup MyMarkdownMappings
    autocmd!
    autocmd BufEnter, *.md nnoremap <Leader>- YpVr-
    autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
    autocmd BufEnter, *.md nnoremap ]] :AerialNext<CR>
    autocmd BufEnter, *.md nnoremap [[ :AerialPrevious<CR>
augroup END

