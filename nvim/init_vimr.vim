" Plugins {{{
call plug#begin('~/.vim/plugged-vimr')
Plug 'mhinz/vim-startify'                                      " Welcome page
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim',                                      " Zen editor
Plug 'junegunn/limelight.vim'                                  " Goyo extension to focus on a paragraph
Plug 'godlygeek/tabular'                                       " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown',
call plug#end()
" }}}

" Misc {{{
let g:vim_markdown_folding_disabled = 1
let g:startify_bookmarks = [
            \ { 'w': '~/SynologyDrive/wikis/vimwiki/index.md' },
            \ ]
" }}}

" Options {{{
colorscheme seoul256-light
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set nowrap
set textwidth=70
set shiftwidth=4
set laststatus=0
" }}}


" Goyo/Limelight config {{{
let g:goyo_height = "70%"
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

" Mappings {{{
let mapleader = "\<Space>"
nnoremap <Leader>w<Leader>w :e ~/SynologyDrive/wikis/vimwiki/diary/`date +\%Y-\%m-\%d`.md<CR>
autocmd BufEnter, *.md nnoremap <Leader>- YpVr-
autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
nnoremap <Leader>f :e %:h<CR>
nnoremap <Leader>s :Startify<CR>
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
" }}}

" Abbrev {{{
:iab cdate <c-r>=strftime("%Y-%m-%d")<CR>
:iab chour <c-r>=strftime("%H:%M")<CR>
" }}}

" syntax match Normal '\[X\]' conceal cchar=☑
" syntax match Normal '\[_\]' conceal cchar=☐
set conceallevel=2
if has('conceal')
    let s:checkbox_unchecked = "◻"
    let s:checkbox_checked = "✔"
    " let s:checkbox_checked = "✅"
    au BufEnter, *.md :syntax match markdownCheckbox "^\s*\([-\*] \[[ x]\]\|--\|++\) " contains=markdownCheckboxChecked,markdownCheckboxUnchecked
    au BufEnter, *.md :execute 'syntax match markdownCheckboxUnchecked "\([-\*] \[ \]\|--\)" contained conceal cchar='.s:checkbox_unchecked
    au BufEnter, *.md :execute 'syntax match markdownCheckboxChecked "\([-\*] \[x\]\|++\)" contained conceal cchar='.s:checkbox_checked
endif
hi clear Conceal
set concealcursor=n
