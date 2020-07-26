call plug#begin('~/.vim/plugged')

Plug 'Shougo/defx.nvim', {
            \'do': ':UpdateRemotePlugins',
            \ 'branch': 'master' }                    " File browser (vim-vinegar like)
Plug 'kristijanhusak/defx-icons'                               " Nice icons in defx
Plug 'kristijanhusak/defx-git'                                 " git icon integration for defx
" Plug 'HerringtonDarkholme/yats.vim',                           " TS syntax file (better than typescript-vim)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'                                    " Commenting
Plug 'jason0x43/vim-js-indent',
            \ { 'for': 'javascript' }                          " Syntax for js
Plug 'Yggdroot/vim-mark'                                       " Mark words with color
Plug 'airblade/vim-gitgutter'                                  " Left gutter with modification indication (git)
Plug 'tpope/vim-fugitive'                                      " Git management
Plug 'junegunn/fzf', {
            \'dir': '~/.fzf',
            \'do': './install --all'}                          " Fzf fuzzy finder (ala CtrlP)
Plug 'junegunn/fzf.vim', {'depends': 'fzf'}                    " Fzf fuzzy finder (ala CtrlP)
Plug 'mhinz/vim-startify'                                      " Welcome page
Plug 'godlygeek/tabular'                                       " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown',
            \ { 'for': 'markdown' }
Plug 'chriskempson/base16-vim'                                 " Colorscheme
Plug 'pyrho/base16-vim-lightline', {
            \ 'branch': 'bold-mode'}
Plug 'junegunn/seoul256.vim'                                   " A colorscheme
Plug 'ryanoasis/vim-devicons'                                  " Have nice icons attached to files
Plug 'pangloss/vim-javascript',
            \ { 'for': 'javascript' }
Plug 'junegunn/vim-slash'                                      " Better / * # search mappings
Plug 'elzr/vim-json',
            \ { 'for': 'json' }
Plug 'editorconfig/editorconfig-vim'
Plug 'benknoble/vim-obsession', { 'branch': 'this_session' }   " Waiting on #47 in upstream
Plug 'junegunn/vim-peekaboo'                                   " Peek at registers
Plug 'machakann/vim-sandwich'                                  " The set of operator and textobject plugins to search/select/edit sandwiched textobjects.
Plug 'junegunn/goyo.vim',                                      " Zen editor
            \ { 'for': 'markdown' }
Plug 'junegunn/limelight.vim'                                  " Goyo extension to focus on a paragraph
            \ { 'for': 'markdown' }
Plug 'andymass/vim-matchup'                                    " Better matching of pairs
Plug 'eraserhd/parinfer-rust',                                 " Automatic paren handling in lisp-y languages
            \ {'do': 'cargo build --release',
            \  'for': 'clojure' }
Plug 'justinmk/vim-sneak'                                      " Smart f motions
Plug 'rbong/vim-flog'                                          " Git graph log (integrates with fugitive)
Plug 'joecridge/vim-kinesis', { 'for': 'kinesis' }             " Kinesis syntax files
Plug 'itchyny/lightline.vim'                                   " Lightweight statusline
Plug 'macthecadillac/lightline-gitdiff'                        " Git diff integration in lightline
Plug 'Yggdroot/indentLine'                                     " Show indent
Plug 'jiangmiao/auto-pairs'                                    " Automatically inserts pairs
Plug 'chrisbra/colorizer'                                      " Show colors inline
Plug 'amdt/vim-niji'                                           " Rainbow
Plug 'sirtaj/vim-openscad',
            \ {'for': 'openscad'}
Plug 'guns/vim-sexp'                                           " Clojure
Plug 'jonase/eastwood',                                        " Clojure linting
            \ {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people',
            \ {'for': 'clojure'}
Plug 'tpope/vim-repeat',
            \ {'for': 'clojure'}
Plug 'tpope/vim-salve',                                        " Clojure static support
            \ { 'for': 'clojure' }
Plug 'tpope/vim-classpath',                                    " More clojure stuff i don't understand
            \ { 'for': 'clojure' }
Plug 'tpope/vim-fireplace',                                    " Clojure support
            \ { 'for': 'clojure' }
Plug 'guns/vim-clojure-static',                                " And even more clojure stuff
            \ { 'for': 'clojure' }
Plug 'guns/vim-clojure-highlight',                             " Clojure: extended highliting
             \ { 'for': 'clojure' }
Plug 'stephpy/vim-yaml'
Plug 'lifepillar/pgsql.vim'
Plug 'voldikss/vim-floaterm'                                   " A floating terminal
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 't9md/vim-choosewin'                                      " Move between windows & tabs fast
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'wadackel/vim-dogrun'                                     " Colorscheme
Plug 'raichoo/purescript-vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'lambdalisue/gina.vim'
Plug 'junegunn/vim-plug'                                       " Just to have the docs
Plug 'neovimhaskell/haskell-vim'                               " Haskell support
Plug 'alx741/vim-stylishask'                                   " Haskell auto prettyfier
Plug 'terryma/vim-expand-region'                               " Expand visual selections
Plug 'elixir-editors/vim-elixir'
Plug 'JMcKiern/vim-venter'
" Messes up the bindings sometimes.
" Eg. in tmux or k9s the binding is not longer intercepted by kitty 
" and passed on to the app instead.
"Plug 'knubie/vim-kitty-navigator'
Plug 'coreyja/fzf.devicon.vim'
Plug 'norcalli/nvim-colorizer.lua'                            " Show hex color codes
Plug 'danilamihailov/beacon.nvim'                             " Show where the cursor jumped
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'skbolton/embark'
Plug 'vim-scripts/Improved-AnsiEsc'                           " Display ansi color escapes

" wayyyy too slow compared to coc-prettier 
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'chrisbra/nrrwrgn'

Plug '~/repos/perso/nvim-geat'

Plug 'neovimhaskell/nvim-hs.vim'
Plug '~/repos/perso/my-nvim-hs'

call plug#end()

