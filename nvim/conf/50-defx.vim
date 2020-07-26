" Defx config {{{
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> =
                \ defx#do_action('open_tree_recursive')
    nnoremap <silent><buffer><expr> -
                \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> l
                \ defx#do_action('open')
    nnoremap <silent><buffer><expr> E
                \ defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> P
                \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> K
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
                \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
                \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> h
                \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
                \ defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('execute_command', 'open -R ' . defx#get_candidate().action__path)
    " Bookmarks
    nnoremap <silent><buffer><expr> bd
                \ defx#do_action('cd', ['/Users/pyrho/Desktop/'])
    nnoremap <silent><buffer><expr> bD
                \ defx#do_action('cd', ['/Users/pyrho/Downloads/'])
    nnoremap <silent><buffer><expr> ba
                \ defx#do_action('cd', ['/Users/pyrho/repos/marty/apps/'])
    nnoremap <silent><buffer><expr> bt
                \ defx#do_action('cd', ['/tmp'])
endfunction

" }}}

" " Replace NetRW with Defx {{{
autocmd BufEnter,BufRead,BufNew,BufCreate * call s:browse_check(expand('<amatch>'))
function! s:browse_check(path) abort
    if a:path ==# '' || bufnr('%') != expand('<abuf>')
        return
    endif

    " Disable netrw.
    augroup FileExplorer
        autocmd!
    augroup END

    if &filetype ==# 'defx' && line('$') != 1
        return
    endif

    " For ":edit ~".
    let l:path = fnamemodify(a:path, ':t') ==# '~' ? '~' : a:path

    if isdirectory(l:path)
        call execute('Defx -columns=mark:indent:git:icons:filename:type ' . l:path)
    endif
endfunction
" " }}}
function TestPlease()
    :Defx -columns=mark:indent:git:icons:filename:type<CR>
    :Defx -columns=mark:indent:git:icons:filename:type -new -split=horizontal<CR>
endfunction
