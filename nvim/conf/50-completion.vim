" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" let g:completion_enable_auto_popup = 1
" let g:completion_enable_auto_signature = 1
let g:completion_enable_snippet = 'snippets.nvim'

imap <silent> <c-space> <Plug>(completion_trigger)

let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['snippet']},
    \{'mode': '<c-p>'},
    \{'mode': '<c-n>'}
\]

let g:completion_confirm_key = ""
