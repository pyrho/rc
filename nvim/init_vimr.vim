call plug#begin('~/.vim/plugged-vimr')
Plug 'mhinz/vim-startify'                                      " Welcome page
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim',                                      " Zen editor
Plug 'junegunn/limelight.vim'                                  " Goyo extension to focus on a paragraph
Plug 'godlygeek/tabular'                                       " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown',
call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
let g:vim_markdown_folding_disabled = 1
set nowrap
colorscheme seoul256-light

let g:startify_bookmarks = [
            \ { 'w': '~/SynologyDrive/wikis/vimwiki/index.md' },
            \ ]

set tw=70
let g:goyo_height = "70%"

" Limelight config {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}

let mapleader = "\<Space>"
" Perso wiki and diary stuff {{{
nnoremap <Leader>w<Leader>w :e ~/SynologyDrive/wikis/vimwiki/diary/`date +\%Y-\%m-\%d`.md<CR>

" Markdown Specific {{{
autocmd BufEnter, *.md nnoremap <Leader>- YpVr-
" Underline current line with =
autocmd BufEnter, *.md nnoremap <Leader>= YpVr=
" }}}

" Custom bindings {{{
set laststatus=0
:iab cdate <c-r>=strftime("%Y-%m-%d")<CR>
:iab chour <c-r>=strftime("%H:%M")<CR>
