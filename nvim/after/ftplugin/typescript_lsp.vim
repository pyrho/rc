" Bindings
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

nnoremap <silent><localleader>qf <cmd>lua vim.lsp.buf.code_action()<CR>

nnoremap <silent><localleader>J :NextDiagnostic<CR>
nnoremap <silent><localleader>K :PrevDiagnostic<CR>

" Set the omnifunc for TS
autocmd Filetype typescript setlocal omnifunc=v:lua.vim.lsp.omnifunc
