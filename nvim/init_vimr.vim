" Must be here before the neuron plug is loaded !
" let g:zkdir = $HOME.'/SynologyDrive/zettle/'

" Plugins {{{
call plug#begin('~/.vim/plugged-vimr')
Plug 'mhinz/vim-startify'                                      " Welcome page
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim',                                      " Zen editor
Plug 'junegunn/limelight.vim'                                  " Goyo extension to focus on a paragraph
Plug 'godlygeek/tabular'                                       " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown',
"Plug 'liuchengxu/vim-clap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'BurntSushi/ripgrep'
"Plug 'MaienM/neuron.vim', { 'branch': 'patch-1' }
" Plug 'fiatjaf/neuron.vim'
Plug 'nvim-lua/popup.nvim'
"Plug 'oberblastmeister/neuron.nvim'
Plug 'chiefnoah/neuron-v2.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()
" }}}

" Misc {{{
let g:vim_markdown_folding_disabled = 1
let g:startify_bookmarks = [
            \ { 'w': '~/SynologyDrive/wikis/vimwiki/index.md' },
            \ ]
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" }}}

" Options {{{
colorscheme seoul256-light
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
set nowrap
set textwidth=70
set shiftwidth=4
set laststatus=0

" So that the virtual titles in neuron show up readable
hi clear TabLineFill 
hi link TabLineFill Label

hi link htmlH2 TabLineFill
hi link htmlH3 MoreMsg
hi link htmlH4 rubyClass
" }}}


" Goyo/Limelight config {{{
let g:goyo_height = "70%"
" autocmd! User GoyoEnter Limelight
" autocmd! User GoyoLeave Limelight!
" }}}

" Mappings {{{
let mapleader = "\<Space>"
nnoremap <Leader>w<Leader>w :e ~/SynologyDrive/wikis/vimwiki/diary/`date +\%Y-\%m-\%d`.md<CR>
autocmd BufEnter, *.md nnoremap <Leader>- YpVr-
autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
nnoremap <Leader>f :e %:h<CR>
nnoremap <Leader>S :Startify<CR>
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
inoremap fj <Esc>
inoremap jf <Esc>

" Clap
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>s :Rg<CR>
" }}}

" Abbrev {{{
:iab cdate <c-r>=strftime("%Y-%m-%d")<CR>
:iab chour <c-r>=strftime("%H:%M")<CR>
" }}}

" Zettle {{{
" let g:zkdir = $HOME . '/SynologyDrive/zettle/'
" let g:neuron_dir = '/home/pyrho/SynologyDrive/zettle/'
" let g:style_virtual_title = 'Title'
" let g:path_neuron = $HOME . '/.nix-profile/bin/neuron'
" let g:neuron_executable = '/home/pyrho/.nix-profile/bin/neuron'
" let g:path_jq = '/usr/bin/jq'
" }}}

" Fancy todo checkboxes {{{
set conceallevel=2
if has('conceal')
    let s:bullet_point_1 = '◉'
    let s:bullet_point_2 = '○'
    let s:bullet_point_3 = '✸'
    let s:bullet_point_4 = '✿'
    let s:bullet_point_5 = '◇'
    let s:checkbox_unchecked = "❏"
    " let s:checkbox_unchecked = "◻"
    " let s:checkbox_checked = "✔"
    let s:checkbox_checked = "✓"
    " let s:checkbox_checked = "✅"

    au BufEnter, *.md :syntax match markdownBullet1 "^-\s" contains=markdownBullet1_1
    au BufEnter, *.md :execute 'syntax match markdownBullet1_1 "-" contained conceal cchar='.s:bullet_point_1

    au BufEnter, *.md :syntax match markdownBullet2 "^\s\{4\}-\s" contains=markdownBullet2_2
    au BufEnter, *.md :execute 'syntax match markdownBullet2_2 "-" contained conceal cchar='.s:bullet_point_2

    au BufEnter, *.md :syntax match markdownBullet3 "^\s\{8\}-\s" contains=markdownBullet3_3
    au BufEnter, *.md :execute 'syntax match markdownBullet3_3 "-" contained conceal cchar='.s:bullet_point_3

    au BufEnter, *.md :syntax match markdownBullet4 "^\s\{12\}-\s" contains=markdownBullet4_4
    au BufEnter, *.md :execute 'syntax match markdownBullet4_4 "-" contained conceal cchar='.s:bullet_point_4

    au BufEnter, *.md :syntax match markdownBullet5 "^\s\{16\}-\s" contains=markdownBullet5_5
    au BufEnter, *.md :execute 'syntax match markdownBullet5_5 "-" contained conceal cchar='.s:bullet_point_5

    au BufEnter, *.md :syntax match markdownCheckbox "\(\[[ x]\]\) " contains=markdownCheckboxChecked,markdownCheckboxUnchecked
    au BufEnter, *.md :execute 'syntax match markdownCheckboxUnchecked "\(\[ \]\)" contained conceal cchar='.s:checkbox_unchecked
    au BufEnter, *.md :execute 'syntax match markdownCheckboxChecked "\(\[x\]\)" contained conceal cchar='.s:checkbox_checked
endif
hi clear Conceal
set concealcursor=n
set expandtab
hi Conceal guibg=NONE
let g:style_virtual_title = 'Visual'

" }}}
