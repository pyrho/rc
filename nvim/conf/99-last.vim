" Here be settings that should be applied last

" This needs to be here {{{
" hi CocErrorSign guifg=#d1666a guibg=#353b45
" hi CocInfoSign guibg=#353b45
" hi CocWarningSign guifg=#d1cd66 guibg=#353b45
" hi CocHighlightText guibg=Black
" }}}

hi CursorLine guibg=#2e2b4c
hi CursorColumn guibg=#2e2b4c
hi link TSVariable Identifier

autocmd FileType typescript hi! link Function PreProc

augroup vimrc_todo
    au!
    au Syntax * match MyTodo /@WARNING\|@NOCOMMIT\|@TODO\|@OPTIMIZE\|@FIXME\|@NOTE\|@IMPORTANT\|@IDEA/
augroup END
hi def link MyTodo Todo

let g:conjure#client#fennel#aniseed#aniseed_module_prefix = "aniseed."

hi link LspDiagnosticsUnderline Underlined
