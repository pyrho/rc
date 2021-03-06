function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <buffer> <localleader>d <Plug>(coc-definition)
nmap <buffer> <localleader>y <Plug>(coc-type-definition)
nmap <buffer> <localleader>i <Plug>(coc-implementation)
nmap <buffer> <localleader>r <Plug>(coc-references)
nmap <buffer> <localleader>ag :CocList diagnostics<CR>
nmap <buffer> <localleader>s :<c-u>CocList -I symbols<CR>
nmap <buffer><localleader>ac  <Plug>(coc-codeaction)
nmap <buffer><localleader>qf  <Plug>(coc-fix-current)


" Use K for show documentation in preview window
nnoremap <buffer> K :call <SID>show_documentation()<CR>
nmap <buffer><Localleader>K :call coc#util#float_hide()<CR>

" Highlight symbol under cursor on CursorHold
" 2020-07-16 disabling this, it's annoying because it messes with vim-mark
" " autocmd CursorHold *.ts silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <buffer><Localleader>rn <Plug>(coc-rename)

" Using CocList

" Do default action for next item.
nnoremap <buffer> <localleader>J  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <buffer> <localleader>K  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <buffer> <localleader>p  :<C-u>CocListResume<CR>

" }}}

