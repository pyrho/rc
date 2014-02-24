set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'ctrlp.vim'
Bundle 'Solarized'
Bundle 'The-NERD-tree'
Bundle 'jade.vim'
Bundle 'Mark'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'Syntastic'
Bundle 'Lokaltog/vim-easymotion'


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

if has('gui_running')
	set background=dark
	set guioptions=
	colorscheme solarized
endif
set rnu

"Mappings
map <F1> :NERDTreeToggle<CR>
map <F3> :cp<CR>
map <F4> :cn<CR>

" Settings
set et
set sw=2
set ts=2
set hls
set incsearch
let g:ctrlp_custom_ignore = {'dir': '\v[\/]node_modules$'}
