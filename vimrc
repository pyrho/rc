"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Dein config {{{
" Required:
set runtimepath^=/home/dinesh/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/dinesh/.config/nvim/'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')

call dein#add('leafgarland/typescript-vim') " TS syntax
call dein#add('simnalamburt/vim-mundo') " Visual undo
call dein#add('Quramy/tsuquyomi') " TS completion
call dein#add('Shougo/deoplete.nvim') " Async completion
call dein#add('mhartington/deoplete-typescript')
call dein#add('justinmk/vim-sneak') "Smart motions
call dein#add('vim-airline/vim-airline') " Powerline fork
call dein#add('vim-airline/vim-airline-themes')
"call dein#add('rking/ag.vim') " The Silver Searcher plugin - FZF does that
call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets') "Dont need those.
call dein#add('Shougo/vimproc.vim', {'build': 'make'}) " Interactive command execution
call dein#add('scrooloose/nerdtree') " File sidebar
call dein#add('scrooloose/nerdcommenter') " Commenting
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('jason0x43/vim-js-indent') " Syntax for js
" Disabled because suspected to cause location list issues
" Specially ball breaking when navigation with Tsuquyomi's :TsuReferences
call dein#add('scrooloose/syntastic') " Syntax checker
call dein#add('Yggdroot/vim-mark') " Mark words with color
" call dein#add('tpope/vim-fugitive') "Git management
call dein#add('Sclarki/neonwave.vim') " Used theme
call dein#add('YorickPeterse/happy_hacking.vim') " Theme
"call dein#add('atelierbram/vim-colors_duotones') " Theme
call dein#add('chriskempson/base16-vim') " Theme
call dein#add('ervandew/supertab') " Tab completion
"call dein#add('airblade/vim-gitgutter') " Left gutter with modification indication (git) (Causes issue with tsuqyomi
call dein#add('mustache/vim-mustache-handlebars') " Syntax for .hbs
call dein#add('lambdalisue/vim-gita') " Git tool
call dein#add('junegunn/fzf', {'build': './install --all', 'merged': 0}) " Fzf fuzzy finder (ala CtrlP)
call dein#add('junegunn/fzf.vim', {'depends': 'fzf'}) " Fzf fuzzy finder (ala CtrlP)
call dein#add('vimwiki/vimwiki.git')
call dein#add('Olical/vim-enmasse') " Mass actions through the quick fix window
" Required:
call dein#end()

" Required:
syntax on
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" }}}

if has("unix")
  set shell=bash
endif
let hostname = substitute(system('hostname'), '\n', '', '')

" Base16 colors fix {{{
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
hi MatchParen cterm=bold ctermbg=none ctermfg=red
" }}}

" Supertab config {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}
" Airline config {{{
let g:airline#extensions#tabline#enabled = 1
if has("win32")
    let g:airline_powerline_fonts = 0
endif
if has("unix")
    let g:airline_powerline_fonts = 1
endif

"let g:airline_theme='papercolor'
let g:airline_theme='luna'
" }}}
" Deoplete config {{{
let g:deoplete#enable_at_startup = 1
" }}}
"Syntastic config {{{
 let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript'],
                               \ 'passive_filetypes': [''] }
let b:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'

let g:syntastic_c_remove_include_errors = 1
" This allows syntastic to read the tsconfig.json file.
let g:syntastic_typescript_tsc_fname = ''

let g:syntastic_typescript_checkers = ['tslint']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
" }}}
" Neosnippets config {{{
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

let g:neosnippet#snippets_directory='~/.vimsnippets'
let g:neosnippet#disable_runtime_snippets={'_': 1}

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
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
let g:gitgutter_map_keys = 0
set backspace=indent,eol,start
autocmd BufWritePre * %s/\s\+$//e "Automatically Remove trailing whitespaces
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20
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
set foldmethod=syntax
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
set smartcase
" That make so that even while 'smartcase' is enabled, * and # still respect case
:nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
:nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>
set laststatus=2
set encoding=utf-8
set nocursorline                    " Apparently this causes slowness.
set nocursorcolumn                  " This too.
set hlsearch
set showmatch                       " Jump to matching [{()}] when inserting
set undofile                        " Tell it to use an undo file
set fileformat=unix
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
" FZF mappins {{{
map <C-F> :FZF<CR>
map <C-B> :Buffers<CR>
map <C-L> :BLines<CR>
" }}}
map <Leader>a :Ag
map <F2> :cp<CR>
map <F3> :cn<CR>
map te :tabedit %<CR>
map tc :tabclose<CR>
map <M-LEFT> gT
map <F1> :NERDTreeToggle<CR>
map <M-RIGHT> gt
map <silent> <F7> :!xterm<CR>
nnoremap <Leader>no :nohlsearch<CR>
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
nmap <Leader><Leader> V
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
map <Leader>n :lne<CR>
map <Leander>p :lpr<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>q :q<CR>
map <Leader>f :NERDTreeFind<CR>
map <Leader>g :Gita status<CR>
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
" NERTTree config {{{
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
let NERDTreeShowLineNumbers=1
" }}}
" NERDCommenter config {{{

let g:NERDCustomDelimiters = {
            \ 'javascript': { 'left': '// ', 'leftAlt': '/*'}
            \ }
" }}}
" Ack config {{{
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
" }}}
" Colorscheme {{{
if has("gui_running")
    colorscheme badwolf
endif

if has('nvim')
    "colorscheme neonwave
    "colorscheme happy_hacking
    " colorscheme duotone-darkearth
    "colorscheme PaperColor
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%150v.\+/
set colorcolumn=80
" }}}
" Whiplash config {{{
let g:WhiplashProjectsDir = "~/repos/"
let g:WhiplashConfigDir = "~/.whiplash/"
" }}}
" Tsuquyomi config {{{
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
" }}}
" NeoVim Config {{{
let g:python_host_prog = '/usr/bin/python'
" }}}

" vim:foldmethod=marker:foldlevel=0
