function WebDevIconsGetFileTypeSymbol() 
    return luaeval("require'nvim-web-devicons'.get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'), { default = true })")
endfunction

function! ObsessionStatusEnhance() 
    let obsStatus = ObsessionStatus("  \uf04b  ","  \uf04c  ")
    if obsStatus !=# ""
        return obsStatus
    else
        return "  \uf04d  "
    endif
endfunction

function! MyCWD()
    return ' %{fnamemodify(getcwd(), ":t")}'
endfunction

lua <<EOF
require('lualine').setup {
    options = {
    -- section_separators = {'', ''},
    -- component_separators = {'', ''},
        theme = 'tokyonight',
        extensions = { 'fzf', 'fugitive' },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch'},
        lualine_c = {{'filename', file_status = true, full_path = true, shorten = true }},

        lualine_x = {'ObsessionStatusEnhance', {'diagnostics', sources = { 'nvim_lsp'}}  },
        lualine_y = {'WebDevIconsGetFileTypeSymbol' , 'progress', 'location' },
        lualine_z = {  'MyCWD'}
    },
}
EOF
