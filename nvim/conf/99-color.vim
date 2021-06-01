let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 0
let g:tokyonight_italic_keywords = 0
let g:tokyonight_italic_variables = 0
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer", "defx" ]

if has('nvim')
    if has("gui_vimr")
        colorscheme seoul256-light
    else
        set background=dark
        "colorscheme dogrun
        " colorscheme base16-onedark
        "colorscheme base16-onedark
        "color space-vim-dark
        "colorscheme dracula
        "hi Comment cterm=italic
        "set termguicolors
        "hi LineNr ctermbg=NONE guibg=NONE
        " colorscheme embark
        " let g:embark_terminal_italics = 1
        colorscheme tokyonight
    endif
endif
