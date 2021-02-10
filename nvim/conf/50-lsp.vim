" Sign Customization
sign define LspDiagnosticsSignError text=😓 texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=😗 texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=💁 texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=📎 texthl=LspDiagnosticsSignHint linehl= numhl=

" Diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
let g:space_before_virtual_text = 5

" " lsp-status setup
" lua <<EOF
" local lsp_status = require('lsp-status')
" lsp_status.register_progress()
" local kind_labels_mt = {__index = function(_, k) return k end}
" local kind_labels = {}
" lsp_status.config({
"   kind_labels = kind_labels,
"   indicator_errors = "×",
"   indicator_warnings = "!",
"   indicator_info = "i",
"   indicator_hint = "›",
"   -- the default is a wide codepoint which breaks absolute and relative
"   -- line counts if placed before airline's Z section
"   status_symbol = "",
"   kind_labels
" })
" EOF

"" This is needed to update the lsp statuse in lightline.
autocmd User LspDiagnosticsChanged call lightline#update()


" TSServer setup
lua <<EOF
require'lspconfig'.tsserver.setup{
    cmd = { "${HOME}/.cache/nvim/lspconfig/tsserver/node_modules/.bin/typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    on_attach = function(opts)
        -- require'diagnostic'.on_attach(opts)
        require'completion'.on_attach(opts)
        --require'lsp-status'.on_attach(opts)
        -- vim.api.nvim_command("au BufWritePost <buffer> silent! lua require'format.formatter'.format()")
    end,
    --capabilities = lsp_status.capabilities
}
EOF

" Mappings
" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" "nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" " nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> g0 <cmd>lua require'telescope.builtin'.lsp_document_symbols{ shorten_path = true }<CR>
" "nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>


nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gW <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{ shorten_path = true }<CR>
nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
nnoremap <silent> g0 <cmd>lua require'telescope.builtin'.lsp_document_symbols{ shorten_path = true }<CR>


"nnoremap <silent><localleader>qf <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><localleader>qf <cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>

nnoremap <leader>J <cmd>lua vim.lsp.diagnostic.goto_next({ enable_popup = true })<CR>
nnoremap <leader>K <cmd>lua vim.lsp.diagnostic.goto_prev({ enable_popup = true })<CR>
nnoremap <leader>O <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

" See https://github.com/nvim-lua/diagnostic-nvim/issues/73 for more info
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 1,
      prefix = '↩',
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(bufnr, client_id)
      local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
      -- No buffer local variable set, so just enable by default
      if not ok then
        return true
      end

      return result
    end,
    -- Disable a feature
    update_in_insert = false,
  }
)
EOF
