" Use completion only for typescript
" lua require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}

" Use completion-nvim in every buffer
" This is killing my VIM with a lua PANIC..
" autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" let g:completion_enable_auto_popup = 1
" let g:completion_enable_auto_signature = 1
" let g:completion_enable_snippet = 'snippets.nvim'

imap <silent> <c-space> <Plug>(completion_trigger)
