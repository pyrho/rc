"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=/home/pyrho/.dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/pyrho/.dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Dein plugins {{{
call dein#add('leafgarland/typescript-vim')
"call dein#add('HerringtonDarkholme/yats.vim')
call dein#add('Quramy/tsuquyomi')
call dein#add('Shougo/deoplete.nvim')
call dein#add('sjl/badwolf') 
call dein#add('sjl/gundo.vim')
call dein#add('justinmk/vim-sneak')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('rking/ag.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('kien/ctrlp.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('jason0x43/vim-js-indent')
call dein#add('scrooloose/syntastic')
call dein#add('Yggdroot/vim-mark')
call dein#add('tpope/vim-fugitive')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('Sclarki/neonwave.vim')
" You can specify revision/branch/tag.
call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()
" }}}

" Required:
syntax on
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

if has("unix")
  set shell=bash
endif
set nocp
let hostname = substitute(system('hostname'), '\n', '', '')

" Plugins {{{
"if has("win32")
    "call plug#begin("~/vimfiles/bundle")
"endif
"
"if has("unix")
    "call plug#begin("~/.vim/bundle")
"endif

"Plug 'https://github.com/rking/ag.vim'                      "Silver searcher
"Plug 'The-NERD-tree'
"Plug 'narrow_region'
"Plug 'Mark'
""Plug 'bling/vim-airline'
"Plug 'ctrlp.vim'
"Plug 'cpp.vim'
"Plug 'vimwiki'
"Plug 'vim-coffee-script'
""Plug 'justinmk/vim-sneak'
"Plug 'JavaScript-syntax'
"Plug 'Syntastic'
"Plug 'https://github.com/myhere/vim-nodejs-complete'
"Plug 'jade.vim'
"Plug 'vim-json-bundle'
"Plug 'Better-Javascript-Indentation'
"Plug 'https://github.com/vim-scripts/SuperTab--Van-Dewoestine'
"Plug 'https://github.com/arkwright/vim-whiplash.git'
"Plug 'DoxygenToolkit.vim'
"Plug 'DoxyGen-Syntax'
"Plug 'Markdown'
"Plug 'wting/rust.vim'
"Plug 'https://github.com/terryma/vim-expand-region'
"Plug 'mustache/vim-mustache-handlebars'
"Plug 'The-NERD-Commenter'
"Plug 'https://github.com/terryma/vim-multiple-cursors'
""Plug 'https://github.com/sjl/badwolf'                           "Colorscheme
""Plug 'https://github.com/sjl/gundo.vim'                     "Visual undo
"call plug#end()                                                 " Required
" }}}

"filetype plugin indent on

" Airline config {{{
let g:airline#extensions#tabline#enabled = 1
if has("win32")
    let g:airline_powerline_fonts = 0
endif
if has("unix")
    let g:airline_powerline_fonts = 1
endif

"let g:airline_theme='papercolor'
let g:airline_theme='kolor'
" }}}

" Deoplete config {{{
let g:deoplete#enable_at_startup = 1
" }}}

"Syntastic config {{{
 let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript'],
                               \ 'passive_filetypes': [''] }

let g:syntastic_c_remove_include_errors = 1
" This allows syntastic to read the tsconfig.json file.
let g:syntastic_typescript_tsc_fname = ''
" }}}

" Backup {{{
set backup
if has("win32")
    set backupdir=H:/_vimswap
    set directory=H:/_vimswap
endif
if has("unix")
    set backupdir=~/.vimswap
    set directory=~/.vimswap
endif
" }}}
" Misc {{{
set makeef=error.err
set backspace=indent,eol,start
" }}}
" Abbreviations {{{
:iab cdate // DRA <c-r>=strftime("%Y-%m-%d")<CR>:
:iab rnP return new Promise(function(resolve, reject){<CR>});<C-O>O
:iab JSO JSON.stringify
:iab clog console.log
:iab cdatef // DRA_Fix_<c-r>=strftime("%Y-%m-%d")<CR>_
:iab boxcom ////////////////////////////////////////////////////////////////////////////////<C-O>o//
:iab tryc TRY_KW<C-O>o{<C-O>o}<C-O>oCATCH_NORMAL_NOPRE
" }}}
" Filetype Settings [require autocmd] {{{
if has("autocmd")
  autocmd BufEnter *.c,*.h set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-c,i,k nowrap cindent smartindent
  autocmd BufEnter *.C,*.cpp,*.hh,*.cc,*.hxx set formatoptions=croql comments=sr:/*,mb:**,el:*/ cpt=k~/.complete-cpp,i,k cindent smartindent
  autocmd BufEnter, *.handlebars,*.hbs set ft=html syntax=handlebars
endif
" }}}
" Tabs & spaces {{{
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
" }}}
" Options {{{
set foldmethod=indent
set foldenable
set foldlevelstart=10               " Only fold nested stuff
set foldnestmax=10                  " Don't fold too deeply nested stuff
set wildmenu                        " Visual autocomplete for command menu
set completeopt=longest,menuone
set lazyredraw                      " Redraw only when we need to.
set modelines=1                     " Process file specific options
set guioptions=                     " Disabled all GUI chrome
set relativenumber
set number                          " Shows the line # on the current line (with 'relativenumber)
set incsearch
set mouse=ar
set ignorecase
set laststatus=2
set encoding=utf-8
set cursorline
set cursorcolumn
set hlsearch
set showmatch                       " Jump to matching [{()}] when inserting
set undofile                        " Tell it to use an undo file
" Set a directory to store the undo history
if has("win32")
    set undodir=H:/vimundo
endif
if has("unix")
    set undodir=~/.vimundo/
endif
" }}}
" Custom bindings {{{
let mapleader = "\<Space>"
"Hilight last inserted text
nnoremap gV `[v`]
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
nnoremap <Leader>no :nohlsearch<CR>
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
nnoremap <Leader>w :wa<CR>
"Open ag.vim
nnoremap <leader>a :Ag
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
" }}}
" Font {{{
if has("unix")
    if hostname == "thinkvb"
        set gfn=Droid\ Sans\ Mono\ for\ Powerline\ 10
    else
        set gfn=Droid\ Sans\ Mono\ 9\
    endif
endif

if has("win32")
    set gfn=Consolas:h10:cANSI
endif
" }}}
" CtrlP config {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}
" NERTTree config {{{
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeShowLineNumbers=1
" }}}
" Ack config {{{
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
" }}}
" Colorscheme {{{
if has("gui_running")
    colorscheme badwolf
endif

if has('nvim')
    colorscheme neonwave   
    "set background=light
    "colorscheme PaperColor
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.\+/
" }}}
" Whiplash config {{{
let g:WhiplashProjectsDir = "~/repos/"
let g:WhiplashConfigDir = "~/.whiplash/"
" }}}
" Tsuquyomi config {{{
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
