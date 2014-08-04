set shell=bash
set nocp
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'Tagbar'
Bundle 'gmarik/vundle'
"Bundle 'Lokaltog/vim-easymotion' now using vim-sneak
Bundle 'The-NERD-tree'
Bundle 'NERD_Tree-and-ack'
"Bundle 'clang-complete' to slow...
Bundle 'narrow_region'
"Bundle 'Command-T' deson't work on windows
Bundle 'Mark'
Bundle 'mileszs/ack.vim'
Bundle 'https://github.com/vim-scripts/a.vim'
"Bundle 'vmark.vim--Visual-Bookmarking'
Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'Solarized'
Bundle 'ctrlp.vim'
Bundle 'cpp.vim'
Bundle 'vimwiki'
"Bundle 'vcscommand.vim'
"Bundle 'https://github.com/wookiehangover/jshint.vim'
Bundle 'vim-coffee-script'
"Bundle 'yankstack'
Bundle 'justinmk/vim-sneak'
Bundle 'JavaScript-syntax'
Bundle 'Syntastic'
Bundle 'https://github.com/myhere/vim-nodejs-complete'
Bundle 'jade.vim'
Bundle 'vim-json-bundle'
Bundle 'Better-Javascript-Indentation'

filetype plugin indent on


"let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'
"let g:Powerline_colorscheme = 'skwp'
 let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript'],
                               \ 'passive_filetypes': [] }

syntax on
" BACKUP
set backup
set backupdir=~/.vimswap
set directory=~/.vimswap
set makeef=error.err
set backspace=indent,eol,start

" Abbreviations
" --------------------------------------- "
:iab cdate // DRA <c-r>=strftime("%Y-%m-%d")<CR>:
:iab cdatef // DRA_Fix_<c-r>=strftime("%Y-%m-%d")<CR>_
:iab boxcom ////////////////////////////////////////////////////////////////////////////////<C-O>o//

" Filetype Settings [require autocmd]
if has("autocmd")
  autocmd BufEnter *.c,*.h set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-c,i,k nowrap cindent smartindent
  autocmd BufEnter *.C,*.cpp,*.hh,*.cc,*.hxx set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-cpp,i,k cindent smartindent foldmethod=marker
endif

set background=dark
set guioptions=
set rnu
set ts=4
set sw=4
set incsearch
set mouse=ar
set ic
set laststatus=2
set encoding=utf-8
set expandtab

map <C-F> :CtrlP<CR>
map <C-B> :CtrlPBuffer<CR>
map <F2> :cp<CR>
map <F3> :cn<CR>
map te :tabedit %<CR>
map tc :tabclose<CR>
map <M-LEFT> gT
map <F1> :NERDTreeToggle<CR>
map <M-RIGHT> gt
map <silent> <F7> :!gnome-terminal<CR>

set gfn=Inconsolata\ 9
let g:ctrlp_working_path_mode = 0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeShowLineNumbers=1
let g:ackprg="ack -H --nocolor --nogroup --column"
let g:ctrlp_custom_ignore = 'node_modules'

colorscheme solarized
