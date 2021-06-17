"
" lua << EOF
"   require("trouble").setup {
"     -- your configuration comes here
"     -- or leave it empty to use the default settings
"     -- refer to the configuration section below
"   }
" EOF
"
" nnoremap <leader>xx <cmd>LspTroubleToggle<cr>
" nnoremap <leader>xw <cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>
" nnoremap <leader>xd <cmd>LspTroubleToggle lsp_document_diagnostics<cr>
" nnoremap <leader>xq <cmd>LspTroubleToggle quickfix<cr>
" nnoremap <leader>xl <cmd>LspTroubleToggle loclist<cr>
" nnoremap gr <cmd>LspTroubleToggle lsp_references<cr>
