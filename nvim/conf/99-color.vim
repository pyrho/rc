if has('nvim')
    if has("gui_vimr")
        colorscheme seoul256-light
    else
        set background=dark
        colorscheme base16-onedark
        "color space-vim-dark
        "colorscheme dracula
        "hi Comment cterm=italic
        "set termguicolors
        "hi LineNr ctermbg=NONE guibg=NONE
    endif
endif
