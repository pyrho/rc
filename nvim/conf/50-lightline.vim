" Lightline config {{{
set showtabline=2
let g:lightline = {}
"let g:lightline.colorscheme = 'base16_onedark'
let g:lightline.colorscheme = 'dogrun'
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline.inactive = {
            \ 'left': [ [ 'relativepath' ] ],
            \ 'right': [ [ 'percent' ] ],
            \}
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste', ],
            \           [ 'readonly', 'relativepath', 'modified' ],
            \           [ 'currentFunc' ] ],
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'devicons_filetype', 'devicons_fileformat'],
            \            [ 'obsession' ],
            \            [ 'coc_error', 'coc_warning' ] ]
            \}

let g:lightline.tabline = {
            \ 'left': [ [ 'vim_logo', 'tabs' ] ],
            \ 'right': [ ['myCurrentDir'],
            \            [ 'gitstatus' ] ]
            \ }
function! ObsessionStatusEnhance() 
    let obsStatus = ObsessionStatus("\uf04b","\uf04c")
    if obsStatus !=# ""
        return obsStatus
    else
        return "\uf04d"
    endif
endfunction

let g:lightline.component = {
            \ 'myCurrentDir': '🗂  %{fnamemodify(getcwd(), ":t")}',
            \ 'currentFunc': '%{CocCurrentFunction()}',
            \ 'obsession': '%{ObsessionStatusEnhance()}',
            \ 'gitstatus': '%{lightline_gitdiff#get_status()}',
            \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
            \ 'vim_logo': "\ue7c5",
            \ 'mode': '%{lightline#mode()}',
            \ 'absolutepath': '%F',
            \ 'relativepath': '%f',
            \ 'filename': '%t',
            \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
            \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
            \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \ 'modified': '%M',
            \ 'bufnum': '%n',
            \ 'paste': '%{&paste?"PASTE":""}',
            \ 'readonly': '%R',
            \ 'charvalue': '%b',
            \ 'charvaluehex': '%B',
            \ 'percent': '%2p%%',
            \ 'percentwin': '%P',
            \ 'spell': '%{&spell?&spelllang:""}',
            \ 'lineinfo': '%2p%% %3l:%-2v',
            \ 'line': '%l',
            \ 'column': '%c',
            \ 'close': '%999X X ',
            \ 'winnr': '%{winnr()}'
            \ }
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction
let g:lightline_gitdiff#indicator_added = "\uf067"
let g:lightline_gitdiff#indicator_deleted = "\uf068"
let g:lightline_gitdiff#indicator_modified = "\uf12a"

function! CocCurrentFunction()
    let currentFunctionSymbol = get(b:, 'coc_current_function', '')
    " See :h lightline expand_component & https://github.com/itchyny/lightline.vim/issues/236
    " return currentFunctionSymbol !=# '' ? "%%#LineNr#%% \uf6a6 " .currentFunctionSymbol : ''
    " return currentFunctionSymbol !=# '' ? "\uf6a6 " .currentFunctionSymbol : ''
    return currentFunctionSymbol !=# '' ? "\ufb26 [" . currentFunctionSymbol . ']' : ''
endfunction


function! CocError() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  if get(info, 'error', 0)
    return "\u2716 " . info['error']
  else
    return ''
  endif
endfunction

function! CocWarning() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  if get(info, 'warning', 0)
    return "\uf071 " . info['warning']
  else
    return ''
  endif
endfunction

let g:lightline.component_function = {
            \ 'fugitive': 'LightlineFugitive',
            \ 'devicons_filetype': 'WebDevIconsGetFileTypeSymbol',
            \ 'devicons_fileformat': 'WebDevIconsGetFileFormatSymbol',
            \ }
            " \ 'currentFunc': 'CocCurrentFunction'

let g:lightline.component_expand = {
            \ 'coc_error': 'CocError',
            \ 'coc_warning': 'CocWarning'
            \ }
let g:lightline.component_type = {
            \ 'coc_error': 'error',
            \ 'coc_warning': 'warning'
            \}

            " \ 'obsession': 'ObsessionStatus() !=# ""'
let g:lightline.component_visible_condition = {
            \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
            \ 'obsession': '1'
            \}
" }}}
