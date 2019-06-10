" Markdown Specific {{{
autocmd BufEnter, *.md nnoremap <Leader>- YpVr-
" Underline current line with =
autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
" }}}

" Custom bindings {{{
let mapleader = "\<Space>"
let maplocalleader = "\<BS>"
" Mark mappings {{{
nmap <Leader>N <Plug>MarkAllClear
" }}}
 " Move current line one line down
nnoremap - :m .+1<CR>
" Move current line one line up
nnoremap _ :m .-2<CR>
map <Leader>A :S <C-r><C-w><CR>
nnoremap gV `[v`]
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
map te :exec 'tabedit' '+'.line('.') '%'<CR>
map tc :tabclose<CR>
map <silent><F1> :Defx -columns=git:icons:filename:type -split=vertical -winwidth=50 -direction=topleft<CR>
nmap <silent><Leader>f :Defx -columns=git:icons:filename:type `expand('%:p:h')` -search=`expand('%:p')`<CR>
map <M-LEFT> gT
map <M-RIGHT> gt
nnoremap <Leader>no :nohlsearch<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
map <Leader>y "+yy
map <Leader>p "+p
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>S :Startify<CR>
" }}}
" vim-slash config {{{
noremap <plug>(slash-after) zz
" }}}
" Fugitive {{{
autocmd BufReadPost fugitive://* set bufhidden=delete
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gl :Silent Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
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
nnoremap <F7> :Nuake<CR>
inoremap <F7> <C-\><C-n>:Nuake<CR>
tnoremap <F7> <C-\><C-n>:Nuake<CR>
" }}}

" EasyMotion config {{{
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map s <Plug>(easymotion-s)
" }}}

map <F11> :GitGutterPrevHunk<CR>
map <F12> :GitGutterNextHunk<CR>

" Perso wiki and diary stuff {{{
nnoremap <Leader>w<Leader>w :e ~/SynologyDrive/wikis/vimwiki/diary/`date +\%Y-\%m-\%d`.md<CR>
" }}}
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>o :call Fzf_dev()<CR>

inoremap <Esc> <Esc>:w<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>
