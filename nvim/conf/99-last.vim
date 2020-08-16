" Here be settings that should be applied last

" This needs to be here {{{
" hi CocErrorSign guifg=#d1666a guibg=#353b45
" hi CocInfoSign guibg=#353b45
" hi CocWarningSign guifg=#d1cd66 guibg=#353b45
" hi CocHighlightText guibg=Black
" }}}

hi CursorLine guibg=#2e2b4c
hi CursorColumn guibg=#2e2b4c

autocmd FileType typescript hi! link Function Operator
" autocmd FileType typescript match NIK /WARNING\|NOCOMMIT/
" autocmd FileType typescript hi! NIK Todo

augroup vimrc_todo
    au!
    au Syntax * match MyTodo /@WARNING\|@NOCOMMIT\|@TODO|@OPTIMIZE|@FIXME/
augroup END
hi def link MyTodo Todo


