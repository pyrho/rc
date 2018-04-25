if &compatible
  set nocompatible               " Be iMproved
endif

" Dein config {{{
" Required:
set runtimepath^=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.cache/dein'))

" Let dein manage dein
call dein#add('Shougo/dein.vim')

call dein#add('Shougo/unite.vim') "Required for vimfiler
call dein#add('Shougo/vimfiler.vim')

"call dein#local('/home/dinesh/testnvim')
call dein#add('neovim/node-host', { 'branch': 'next', 'do': 'npm install -g neovim@next' })
call dein#add('HerringtonDarkholme/yats.vim') " TS syntax file (better than typescript-vim)
call dein#add('simnalamburt/vim-mundo') " Visual undo
call dein#add('Shougo/deoplete.nvim') " Async completion
call dein#add('mhartington/nvim-typescript') " TS code browsing, better than Tsu
"call dein#add('pyrho/nvim-typescript', { 'rev': 'pyrhospatches'})
"call dein#add('/home/dinesh/repos/forks/nvim-typescript-upstream')
"call dein#add('/home/dinesh/repos/forks/nvim-typescript')
"call dein#add('mhartington/nvim-typescript')
call dein#add('justinmk/vim-sneak') "Smart motions
call dein#add('vim-airline/vim-airline') " Powerline fork
call dein#add('vim-airline/vim-airline-themes')
call dein#add('Shougo/neosnippet.vim') "Snippets
call dein#add('Shougo/vimproc.vim', {'build': 'make'}) " Interactive command execution
call dein#add('tpope/vim-commentary') " Commenting
call dein#add('jason0x43/vim-js-indent') " Syntax for js
" call dein#add('scrooloose/syntastic') " Syntax checker
call dein#add('neomake/neomake')
call dein#add('Yggdroot/vim-mark') " Mark words with color
call dein#add('ervandew/supertab') " Tab completion
call dein#add('airblade/vim-gitgutter') " Left gutter with modification indication (git) (Causes issue with tsuqyomi
call dein#add('mustache/vim-mustache-handlebars') " Syntax for .hbs
call dein#add('tpope/vim-fugitive') " Git (better than gina)
" These two lines are needed, see: https://github.com/Shougo/dein.vim/issues/74
call dein#add('junegunn/fzf', {'build': './install --all', 'merged': 0}) " Fzf fuzzy finder (ala CtrlP)
call dein#add('junegunn/fzf.vim', {'depends': 'fzf'}) " Fzf fuzzy finder (ala CtrlP)
" call dein#add('Mephistophiles/vimwiki') " Fork of vimwiki/vimwiki.git, with an option to disable mappings
call dein#add('JamshedVesuna/vim-markdown-preview') " Preview markdown
call dein#add('mhinz/vim-startify')
call dein#add('chrisbra/NrrwRgn') " Narrow to a region of a buffer
call dein#add('MattesGroeger/vim-bookmarks') " Bookmarks manager
call dein#add('chriskempson/base16-vim')
call dein#add('vimlab/mdn.vim') " Mozilla Developper Network integration
call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('pangloss/vim-javascript')
call dein#add('davidhalter/jedi-vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('tomlion/vim-solidity')
call dein#add('funcodeio/lz4.vim')
call dein#add('junegunn/vim-slash')
call dein#add('elzr/vim-json')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('tpope/vim-obsession') " automatic session management
call dein#add('dhruvasagar/vim-prosession') " complement to vim-obsession to handle sessions dir-wise.
call dein#add('junegunn/vim-peekaboo') " Peek at registers
" Required:
call dein#end()
call dein#save_state()

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
" True color fix {{{
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
" }}}
" VimWiki {{{
"let g:vimwiki_list = [{'path': '~/vimwiki/',
            "\ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_use_mapping = 0
" }}}
" Vim Bookmarks config {{{
let g:bookmarks_save_per_working_dir = 1
let g:bookmark_auto_save = 1
" }}}
" nvim-typescript config {{

let g:nvim_typescript#javascript_support = 1
let g:nvim_typescript#loc_list_item_truncate_after = -1
" run TSSyncErr on write
" autocmd! BufWritePost *.ts,*.tsx TSSyncErr
" }}}
" Supertab config {{{
let g:SuperTabDefaultCompletionType = "context"
" }}}
" Airline config {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#formatter = 'jsformatter'
" }}}

if has("win32")
    let g:airline_powerline_fonts = 0
endif
if has("unix")
    let g:airline_powerline_fonts = 1
endif

let g:airline_theme='wombat'
" }}}
" Deoplete config {{{
let g:deoplete#enable_at_startup = 1
" }}}
" Neomake config {{{
autocmd! BufWritePost * Neomake
" }}}
"Syntastic config {{{
 let g:syntastic_mode_map = { 'mode': 'active',
                               \ 'active_filetypes': ['javascript'],
                               \ 'passive_filetypes': ['typescript'] }
" let b:syntastic_javascript_eslint_exec = './node_modules/.bin/eslint'

let g:syntastic_c_remove_include_errors = 1
" This allows syntastic to read the tsconfig.json file.
let g:syntastic_typescript_tsc_fname = ''

let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

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
" autocmd BufWritePre * %s/\s\+$//e "Automatically Remove trailing whitespaces
let g:matchparen_timeout = 20
let g:matchparen_insert_timeout = 20
" }}}
" Abbreviations {{{
:iab cdate // DRA <c-r>=strftime("%Y-%m-%d")<CR>:
:iab rnP return new Promise(function(resolve, reject){<CR>});<C-O>O
" :iab JSO JSON.stringify
" :iab clog console.log
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
set nowrap
set foldmethod=syntax
set foldenable
set foldlevelstart=10               " Only fold nested stuff
set foldnestmax=10                  " Don't fold too deeply nested stuff
set wildmenu                        " Visual autocomplete for command menu
set completeopt=longest,menu
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
set cursorline                    " Apparently this causes slowness.
set cursorcolumn                  " This too.
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
" FZF mappins {{{
nnoremap <Leader>o :call Fzf_dev()<CR>
map <Leader>b :Buffers<CR>
map <C-L> :BTS<CR>
" }}}
" nvim-typescipt mappings {{{
autocmd FileType typescript,javascript
            \ map <Leader>d :TSDef<CR> |
            \ map <Leader>t :TSType<CR> |
            \ noremap <Leader>r :TSRefs<CR> |
            \ map <C-P> :TSSearchFZF 
" }}}
" Mark mappings {{{
nmap <Leader>N <Plug>MarkAllClear
" }}}
map <Leader>a :Ag
map <F2> :cp<CR>
nnoremap gV `[v`]
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>
map <F3> :cn<CR>
map <F5> :lprev<CR>
map <F6> :lnext<CR>
map te :tabedit %<CR>
map tc :tabclose<CR>
map <F1> :VimFilerExplorer -find<CR>
nmap <Leader>f :VimFilerBufferDir -force-quit -find<CR>
map <M-LEFT> gT
map <M-RIGHT> gt
map <silent> <F7> :!xterm<CR>
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
imap jj <Esc>
imap kk <Esc>
inoremap {,<CR> {<CR>},<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap {<CR> {<CR>}<ESC>O
inoremap =>{ => {<CR>});<ESC>O
map <Up> :<Up>
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
" Colorscheme {{{
if has("gui_running")
    colorscheme badwolf
endif

if has('nvim')
    "colorscheme neonwave
    "colorscheme happy_hacking
    " colorscheme duotone-darkearth
    "colorscheme PaperColor
    "colorscheme onedark
    set background=dark
    "colorscheme one
    colorscheme base16-onedark
endif

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%150v.\+/
set colorcolumn=80
" }}}
" Trailing whitespace {{{
highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=red
autocmd FileType vimfiler highlight clear OverLength
autocmd FileType startify highlight clear OverLength
"match ExtraWhitespace /\s\+$/
autocmd BufWinEnter *.ts match ExtraWhitespace /\s\+$/
autocmd InsertEnter *.ts match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave *.ts match ExtraWhitespace /\s\+$/
autocmd BufWinLeave *.ts call clearmatches()
" }}}
" NeoVim Config {{{
let g:python_host_prog = '/usr/bin/python'
" }}}
" Startify config {{{
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
            \ { 't': '~/.config/nvim/init.vim' },
            \ { 'n': '~/ownCloud/notes.md' },
            \ { 'r': '~/repos' },
            \ ]

" }}}
" Vimfiler config {{{

function s:define_vimfiler_mappings()
    nmap <buffer> <Enter> <Plug>(vimfiler_cd_or_edit)
    nmap <buffer> o <Plug>(vimfiler_expand_or_edit)
    nmap <buffer> h <Plug>(vimfiler_smart_h)
    nmap <buffer> l <Plug>(vimfiler_smart_l)
    nmap <buffer> cd <Plug>(vimfiler_make_directory)
    nmap <buffer> cf <Plug>(vimfiler_new_file)
    nmap <buffer> sm <Plug>(vimfiler_toggle_safe_mode)
    nmap <buffer> r <Plug>(vimfiler_rename_file)
    nmap <buffer> c <Plug>(vimfiler_copy_file)
    nmap <buffer> m <Plug>(vimfiler_move_file)
    nmap <buffer> q <Plug>(vimfiler_hide)
    nmap <buffer> v <Plug>(vimfiler_preview_file)
    nmap <buffer> yy <Plug>(vimfiler_yank_full_path)
    nmap <buffer> t <Plug>(vimfiler_expand_tree)
    nmap <buffer> T <Plug>(vimfiler_expand_tree_recursive)
    nmap <buffer> d <Plug>(vimfiler_delete_file)
    nmap <buffer> i <Plug>(vimfiler_cd_input_directory)
    nmap <buffer> j <Plug>(vimfiler_loop_cursor_down)
    nmap <buffer> k <Plug>(vimfiler_loop_cursor_up)
    nnoremap <silent><buffer><expr> sp vimfiler#do_switch_action('split')
    nnoremap <silent><buffer><expr> vs vimfiler#do_switch_action('vsplit')
endfunction

let g:vimfiler_no_default_key_mappings = 1
let g:vimfiler_as_default_explorer = 1

autocmd FileType vimfiler call s:define_vimfiler_mappings()


" }}}
" Tmp FZF dev-icons {{{
function! Fzf_dev()
  let l:fzf_files_options =
        \ '--preview "echo {} | tr -s \" \" \"\n\" | tail -1 | xargs rougify | head -'.&lines.'"'
  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:parts = split(a:item, ' ')
    let l:file_path = get(l:parts, 1, '')
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], preview window, [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
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
" EditorConfig {{{
let g:EditorConfig_exclude_patterns = [ 'fugitive://.*', 'scp://.*' ]
" }}}
" Listchars {{{
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.
"set list
set listchars=space:·
set list
" }}}
" Prosession config {{{
let g:prosession_on_startup = 0
" }}}
" Startify config {{{
let g:asciidashlane2 = [
\'                           `-.                              ',
\'                     `-/shmMMMNmyo/.                        ',
\'               .:+sdNMMMMmyo//shmMMMMmyo/-`                 ',
\'        `./+ydNMMMNds+:.         `-/ohmNMMMNhs+-.           ',
\'     :ymMMMMNds+:`                      .:oydNMMMNdy.       ',
\'     sMMh/-`                -                 `-+mMM:       ',
\'     sMM/                   /hhhs/-`             mMM-       ',
\'     oMM+                      ./yMMNh+          NMM        ',
\'     -MMy                    `sdhdMd:-.          NMM        ',
\'     -MMy                       -NM/            `NMM        ',
\'     `NMm                     .yMMMh`           .oo:        ',
\'      mMM`                 `/yMMMMMMm:-                      ',
\'      oMM+           `.-/shNMMMMMMMMmdhhMMsssmmmmsssso`     ',
\'      .MMd       `oNMMMMMMMMMdy+/-`            .MMd         ',
\'       hMM:        -MMMMmy+-                   yMM/         ',
\'       .MMm`     `:dMdo-                      :MMd          ',
\'        oMMy   -sNd+.                        `mMN-          ',
\'         yMMsodmo.                          `mMM/           ',
\'         `mMNs:                            -mMN+            ',
\'       :smy:  :-                          +MMN:             ',
\'       o/`  `dMMy`                      :dMMy`              ',
\'              oNMNo.                  :dMMd:                ',
\'               `sNMMh/`            .+dMMd:                  ',
\'                  +dMMNy/`      .odMMNy:                    ',
\'                    .+hMMMms+oyNMMNy/`                      ',
\'                       `/sdNMMNy+-                          ',
\'                            ``                              ',
\]
let g:startify_custom_header =
            \ 'map(startify#fortune#boxed() + g:asciidashlane2, "\"   \".v:val")'
"
"let g:startify_custom_header =
        "\ map(split(system('fortune | cowsay -f stegosaurus'), '\n'), '"   ". v:val')

" }}}
" }
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

let g:python_host_prog = '/usr/local/bin/python2'

" vim:foldmethod=marker:foldlevel=0
