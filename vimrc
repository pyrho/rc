set shell=bash
set nocp
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/Vundle.vim'

Plugin 'Tagbar'
Plugin 'Solarized'
Plugin 'The-NERD-tree'
Plugin 'NERD_Tree-and-ack'
"Plugin 'clang-complete' to slow...
Plugin 'narrow_region'
Plugin 'Mark'
Plugin 'mileszs/ack.vim'
Plugin 'https://github.com/vim-scripts/a.vim'
Plugin 'https://github.com/Lokaltog/vim-powerline'
Plugin 'ctrlp.vim'
Plugin 'cpp.vim'
Plugin 'vimwiki'
Plugin 'vim-coffee-script'
Plugin 'justinmk/vim-sneak'
Plugin 'JavaScript-syntax'
Plugin 'Syntastic'
Plugin 'https://github.com/myhere/vim-nodejs-complete'
Plugin 'jade.vim'
Plugin 'vim-json-bundle'
Plugin 'Better-Javascript-Indentation'
Plugin 'https://github.com/vim-scripts/SuperTab--Van-Dewoestine'
Plugin 'https://github.com/arkwright/vim-whiplash.git'
Plugin 'DoxygenToolkit.vim'
Plugin 'DoxyGen-Syntax'
Plugin 'Markdown'
Plugin 'wting/rust.vim'
Plugin 'ScmFrontEnd-former-name--MinSCM'
Plugin 'https://github.com/terryma/vim-expand-region'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'The-NERD-Commenter'
Plugin 'https://github.com/terryma/vim-multiple-cursors'

au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars

filetype plugin indent on


"let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = 'default'
"let g:Powerline_colorscheme = 'skwp'
 let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript'],
                               \ 'passive_filetypes': [] }

let g:syntastic_c_remove_include_errors = 1

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
:iab rnP return new Promise(function(resolve, reject){<CR>});<C-O>O
:iab JSO JSON.stringify
:iab clog console.log
:iab cdatef // DRA_Fix_<c-r>=strftime("%Y-%m-%d")<CR>_
:iab boxcom ////////////////////////////////////////////////////////////////////////////////<C-O>o//

" Filetype Settings [require autocmd]
if has("autocmd")
  autocmd BufEnter *.c,*.h set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-c,i,k nowrap cindent smartindent
  autocmd BufEnter *.C,*.cpp,*.hh,*.cc,*.hxx set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-cpp,i,k cindent smartindent foldmethod=marker
endif

set background=light
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
set fillchars+=stl:\ ,stlnc:\
set cursorline
set cursorcolumn

map <C-F> :CtrlP<CR>
map <C-B> :CtrlPBuffer<CR>
map <F2> :cp<CR>
map <F3> :cn<CR>
map te :tabedit %<CR>
map tc :tabclose<CR>
map <M-LEFT> gT
map <F1> :NERDTreeToggle<CR>
map <M-RIGHT> gt
map <silent> <F7> :!xterm<CR>


"http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
let mapleader = "\<Space>"
nmap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
nnoremap <Leader>w :w<CR>

nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>


"set gfn=Inconsolata\ for\ Powerline\ 11
"set gfn=Menlo\ for\ Powerline\ 11
set gfn=Droid\ Sans\ Mono\ 9
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeShowLineNumbers=1
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
let g:ctrlp_custom_ignore = 'node_modules'

if has("gui_running")
    set background=dark
    colorscheme solarized
endif

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
set completeopt=longest,menuone

" Whiplash config
let g:WhiplashProjectsDir = "~/repos/"
let g:WhiplashConfigDir = "~/.whiplash/"

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/
