let g:nvim_typescript#type_info_on_hold = 0
let g:nvim_typescript#javascript_support = 1
let g:nvim_typescript#diagnostics_enable = 1
let g:nvim_typescript#suggestions_enabled = 1

" Mappings
nnoremap K :TSDoc<CR>
nnoremap <localleader>d :TSDef<CR>
nnoremap <localleader>r :TSRefs<CR>
nnoremap <localleader>t :TSType<CR>
