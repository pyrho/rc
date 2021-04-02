lua << EOF
require('neogit').setup{
disable_context_highlighting = true,
  signs = {
    section = {'', ''},
    item = {'', ''},
    hunk = {'', '▾'},
  }
}
EOF

" hi NeogitNotificationInfo guifg=#80ff95
" hi NeogitNotificationWarning guifg=#fff454
" hi NeogitNotificationError guifg=#c44323
"
" hi def NeogitDiffAddHighlight guibg=#404040 guifg=#859900
" hi def NeogitDiffDeleteHighlight guibg=#404040 guifg=#dc322f
" hi def NeogitDiffContextHighlight guibg=#333333 guifg=#b2b2b2
" hi def NeogitHunkHeader guifg=#cccccc guibg=#404040
" hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d
