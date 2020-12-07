" Markdown Specific {{{
autocmd BufEnter, *.md nnoremap <Leader>- YpVr-
" Underline current line with =
autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
" }}}

" Custom bindings {{{
let mapleader = "\<Space>"
let maplocalleader = "\\"
" Mark mappings {{{
nmap <Leader>N <Plug>MarkAllClear
" }}}
nnoremap gV `[v`]
map te :exec 'tabedit' '+'.line('.') '%'<CR>
map tc :tabclose<CR>
map <silent><F1> :Defx -columns=mark:indent:git:icons:filename:type -split=vertical -winwidth=50 -direction=topleft<CR>
map <silent><F2> :Defx -columns=mark:indent:git:icons:filename:type -new -split=vertical<CR>
nmap <silent><Leader>f :Defx -columns=mark:indent:git:icons:filename:type `expand('%:p:h')` -search=`expand('%:p')`<CR>
map <M-LEFT> gT
map <M-RIGHT> gt
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
map <Leader>y "+yy
map <Leader>p "+p
nnoremap <Leader>w :wa<CR>

" Colemak specific
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>S :Startify<CR>
" }}}
" vim-slash config {{{
noremap <plug>(slash-after) zz
" }}}

" Fugitive / GitGutter {{{
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :GitGutterPreviewHunk<CR>
nnoremap <Leader>gp :GitGutterPrevHunk<CR>
nnoremap <Leader>gn :GitGutterNextHunk<CR>
" }}}

" vim-unimpaired inspired mappings {{{
function! s:map(mode, lhs, rhs, ...) abort
  let flags = (a:0 ? a:1 : '') . (a:rhs =~# '^<Plug>' ? '' : '<script>')
  let head = a:lhs
  let tail = ''
  let keys = get(g:, a:mode.'remap', {})
  if type(keys) != type({})
    return
  endif
  while !empty(head)
    if has_key(keys, head)
      let head = keys[head]
      if empty(head)
        return
      endif
      break
    endif
    let tail = matchstr(head, '<[^<>]*>$\|.$') . tail
    let head = substitute(head, '<[^<>]*>$\|.$', '', '')
  endwhile
  exe a:mode.'map' flags head.tail a:rhs
endfunction
map [q :cp<CR>
map ]q :cn<CR>

map [l :lprev<CR>
map ]l :lnext<CR>
function! s:BlankUp(count) abort
  put!=repeat(nr2char(10), a:count)
  ']+1
  silent! call repeat#set("\<Plug>unimpairedBlankUp", a:count)
endfunction

function! s:BlankDown(count) abort
  put =repeat(nr2char(10), a:count)
  '[-1
  silent! call repeat#set("\<Plug>unimpairedBlankDown", a:count)
endfunction

nnoremap <silent> <Plug>unimpairedBlankUp   :<C-U>call <SID>BlankUp(v:count1)<CR>
nnoremap <silent> <Plug>unimpairedBlankDown :<C-U>call <SID>BlankDown(v:count1)<CR>

call s:map('n', '[<Space>', '<Plug>unimpairedBlankUp')
call s:map('n', ']<Space>', '<Plug>unimpairedBlankDown')
" }}}

" Nuake Config {{{
nnoremap <C-t> :FloatermToggle<CR>
inoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
tnoremap <C-t> <C-\><C-n>:FloatermToggle<CR>
" }}}

" EasyMotion config {{{
"map <Leader><Leader>j <Plug>(easymotion-j)
"map <Leader><Leader>k <Plug>(easymotion-k)
"map s <Plug>(easymotion-s)
" }}}


" }}}
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>s :Rgg<CR>

"nnoremap <Leader>b :Clap buffers<CR>
" nnoremap <Leader>b :Buffers<CR>
"nnoremap <Leader>y :Clap yanks<CR>

"nnoremap <Leader>o :Clap files .<CR>
" nnoremap <Leader>o :FilesWithDevicons .<CR>
" Better handing of exclusion patterns
" But does not work because icons are missing
"nnoremap <Leader>o :Clap files ++externalfilter=fzf +async . <CR>
" nnoremap <Leader>A :RgWithDevicons <C-R><C-W><CR>
"nnoremap <Leader>s :RgWithDevicons<CR>
"nnoremap <Leader>P :Clap sessions<CR>
" nnoremap <Leader>/ :BLines<CR>

nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
inoremap fj <Esc>
inoremap jf <Esc>

" Venter
nmap <Leader>v :VenterToggle<CR>

" nmap <Tab> :b #<CR>
