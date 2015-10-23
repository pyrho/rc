if has("unix")
  set shell=bash
endif
set nocp
filetype off

if has("win32")
    call plug#begin("~/vimfiles/bundle")
endif

if has("unix")
    call plug#begin("~/.vim/bundle")
endif

Plug 'Solarized'
Plug 'The-NERD-tree'
Plug 'NERD_Tree-and-ack'
Plug 'narrow_region'
Plug 'Mark'
Plug 'mileszs/ack.vim'
Plug 'https://github.com/vim-scripts/a.vim'
Plug 'powerline/powerline'
Plug 'ctrlp.vim'
Plug 'cpp.vim'
Plug 'vim-coffee-script'
Plug 'justinmk/vim-sneak'
Plug 'JavaScript-syntax'
Plug 'Syntastic'
Plug 'https://github.com/myhere/vim-nodejs-complete'
Plug 'jade.vim'
Plug 'vim-json-bundle'
Plug 'Better-Javascript-Indentation'
Plug 'https://github.com/vim-scripts/SuperTab--Van-Dewoestine'
Plug 'https://github.com/arkwright/vim-whiplash.git'
Plug 'Markdown'
Plug 'wting/rust.vim'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'mustache/vim-mustache-handlebars'
Plug 'The-NERD-Commenter'
Plug 'https://github.com/terryma/vim-multiple-cursors'
call plug#end()            " required

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
if has("win32")
    set backupdir=H:/_vimswap
    set directory=H:/_vimswap
endif
if has("unix")
    set backupdir=~/.vimswap
    set directory=~/.vimswap
endif
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
:iab tryc TRY_KW<C-O>o{<C-O>o}<C-O>oCATCH_NORMAL_NOPRE

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
nmap <Leader><Leader> V
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nnoremap <Leader>w :w<CR>

nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>


"set gfn=Inconsolata\ for\ Powerline\ 11
"set gfn=Menlo\ for\ Powerline\ 11
if has("unix")
    set gfn=Droid\ Sans\ Mono\ 9
endif

if has("win32")
    set gfn=Consolas_for_Powerline_FixedD:h10:cANSI
endif
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeShowLineNumbers=1
if has("unix")
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif
if has("win32")
    let g:ackprg="ack -H --nocolor --nogroup --column"
endif
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
if has("win32")
    set undodir=H:/vimundo
endif
if has("unix")
    set undodir=~/.vimundo/
endif
