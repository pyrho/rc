
" Sign Customization
sign define LspDiagnosticsErrorSign text=😓
sign define LspDiagnosticsWarningSign text=😗
sign define LspDiagnosticsInformationSign text=💁
sign define LspDiagnosticsHintSign text=📎

" Diagnostics
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 1
let g:diagnostic_auto_popup_while_jump = 1
let g:diagnostic_insert_delay = 1
let g:space_before_virtual_text = 5

" lsp-status setup
lua <<EOF
local lsp_status = require('lsp-status')
lsp_status.register_progress()
EOF

"" This is needed to update the lsp statuse in lightline.
autocmd User LspDiagnosticsChanged call lightline#update()

" TSServer setup
lua <<EOF
local lsp_status = require('lsp-status')
require'nvim_lsp'.tsserver.setup{
    on_attach = function(opts)
        require'diagnostic'.on_attach(opts)
        require'completion'.on_attach(opts)
        require'lsp-status'.on_attach(opts)
    end,
    capabilities = lsp_status.capabilities
}
EOF
