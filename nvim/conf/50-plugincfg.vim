let g:EasyMotion_do_mapping = 0

" YATS
let g:typescript_compiler_options = '--noEmit'

" Use locally built version
let g:coc_force_debug = 1

let g:EditorConfig_exclude_patterns = [ 'fugitive://.*', 'scp://.*' ]

let g:goyo_height = "70%"

" Limelight config {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

let g:python_host_prog = '/usr/local/bin/python2'
