" Vim syntax file
" Language: vim-http-client
" Maintainer: Damien "pyrho" Rajon
" Latest Revision: 18 December 2020

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword syntaxElementKeyword keyword1 keyword2 nextgroup=syntaxElement2
syn keyword vimHttpClientHttpVerbs GET POST PATCH PUT

" Matches
syn match vimHttpClientGlobalVar contained '[\$:]\w\+'
syn match vimHttpClientComment '#.*$' contains=vimHttpClientGlobalVar

" Regions
syn region syntaxElementRegion start='x' end='y'

let b:current_syntax = "vim-http-client"

" Colors
hi def link vimHttpClientHttpVerbs Statement
hi def link vimHttpClientGlobalVar Constant
hi def link vimHttpClientComment Comment
hi def link vimHttpClientVarValue Constant
