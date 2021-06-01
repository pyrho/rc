" Lightline config {{{
set showtabline=2
let g:lightline = {}
"let g:lightline.colorscheme = 'base16_onedark'
"let g:lightline.colorscheme = 'dogrun'
let g:lightline.colorscheme = 'embark'

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
            \            [ 'lsp_status' ] ]
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
            \ 'myCurrentDir': ' %{fnamemodify(getcwd(), ":t")}',
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

" Statusline
function! LspStatusOLD() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif
  return ''
endfunction

function! LspStatus() abort
    let sl = ''
    if luaeval('not vim.tbl_isempty(vim.lsp.buf_get_clients(0))')
       let errors = luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Error]])")
       let warnings = luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])")
       let info = luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Hint]])")
       " let warnings = luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])")
       if errors == 0 && warnings == 0
           return '  '
       endif
       "' ×  '.errors . '!' . warnings
       return '  × '.errors . ' ! ' . warnings . ' i ' . info
        " return luaeval("require('lsp-status').status()")
        " let sl.='%#MyStatuslineLSP#E:'
        " let sl.='%#MyStatuslineLSPErrors#%{luaeval("vim.lsp.diagnostic.get_count([[Error]])")}'
        " let sl.='%#MyStatuslineLSP# W:'
        " let sl.='%#MyStatuslineLSPWarnings#%{luaeval("vim.lsp.diagnostic.get_count([[Warning]])")}'
    else
        return ''
    endif
    return sl
endfunction

function WebDevIconsGetFileTypeSymbol() 
    return luaeval("require'nvim-web-devicons'.get_icon(vim.fn.expand('%:t'), vim.fn.expand('%:e'), { default = true })")
endfunction


" Stolen from https://github.com/cj/vim-webdevicons/blob/master/plugin/webdevicons.vim
function! WebDevIconsGetFileFormatSymbol(...)
  let fileformat = ""

  if &fileformat == "dos"
	  let fileformat = ""
	elseif &fileformat == "unix"
		let fileformat = ""
	elseif &fileformat == "mac"
		let fileformat = ""
  endif

  " Temporary (hopefully) fix for glyph issues in gvim (proper fix is with the
  " actual font patcher)
  let artifactFix = "\u00A0"

  "return &enc . " " . fileformat . artifactFix
  return fileformat
endfunction

let g:lightline.component_function = {
            \ 'fugitive': 'LightlineFugitive',
            \ 'devicons_filetype': 'WebDevIconsGetFileTypeSymbol',
            \ 'devicons_fileformat': 'WebDevIconsGetFileFormatSymbol',
            \ }

let g:lightline.component_expand = {
            \ 'lsp_status': 'LspStatus'
            \ }

let g:lightline.component_visible_condition = {
            \ 'gitstatus': 'lightline_gitdiff#get_status() !=# ""',
            \ 'lsp_status': 'not vim.tbl_isempty(vim.lsp.buf_get_clients(0))',
            \ 'obsession': '1'
            \}
" }}}
autocmd CursorMoved call lightline#update()
