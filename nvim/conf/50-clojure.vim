" let g:iced_enable_default_key_mappings = v:true
" aug vim_iced_lint_setting
"     au!
"     au BufWritePost *.clj,*.cljs,*.cljc call iced#lint#current_file()
"     au CursorMoved  *.clj,*.cljs,*.cljc call iced#lint#echo_message()
" aug END
" let g:iced#eastwood#option = {
"             \ 'linters': ['all'],
"             \ 'exclude-linters': ['implicit-dependencies'],
"             \ }
" let g:iced#lint#use_virtual_text = v:true
let g:sexp_enable_insert_mode_mappings = 0
" let g:iced#palette = {
"             \ 'cad': ':IcedEval (cst-buttons.core/main)'
"             \ }
autocmd BufEnter, *.clj nmap <F5> :Require!<CR>
autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry
