call plug#begin('~/.vim/plugged')

Plug 'Shougo/defx.nvim', {
            \'do': ':UpdateRemotePlugins',
            \ 'branch': 'master' }                    " File browser (vim-vinegar like)
Plug 'kristijanhusak/defx-icons'                               " Nice icons in defx
Plug 'kristijanhusak/defx-git'                                 " git icon integration for defx

" Neovim now ships with TS synthax files, also YATS has been overstepping it's
" purpose (see https://github.com/HerringtonDarkholme/yats.vim/issues/218).
" So let's try without it
"Plug 'HerringtonDarkholme/yats.vim',                           " TS syntax file (better than typescript-vim)
"
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-commentary'                                    " Commenting
Plug 'tomtom/tcomment_vim'
Plug 'jason0x43/vim-js-indent',
            \ { 'for': 'javascript' }                          " Syntax for js
Plug 'Yggdroot/vim-mark'                                       " Mark words with color
Plug 'airblade/vim-gitgutter'                                  " Left gutter with modification indication (git)
Plug 'tpope/vim-fugitive'                                      " Git management
Plug 'shumphrey/fugitive-gitlab.vim'                           " Complement to fugitive 
Plug 'tpope/vim-rhubarb'                                       " Complement to fugitive 
Plug 'junegunn/fzf', {
            \'dir': '~/.fzf',
            \'do': './install --all'}                          " Fzf fuzzy finder (ala CtrlP)
Plug 'junegunn/fzf.vim', {'depends': 'fzf'}                    " Fzf fuzzy finder (ala CtrlP)
Plug 'chengzeyi/fzf-preview.vim'
Plug 'mhinz/vim-startify'                                      " Welcome page
Plug 'godlygeek/tabular'                                       " Align stuff easily (must come before vim-markdown)
Plug 'plasticboy/vim-markdown',
            \ { 'for': 'markdown' }
Plug 'chriskempson/base16-vim'                                 " Colorscheme
" Plug 'pyrho/base16-vim-lightline', {
"             \ 'branch': 'bold-mode'}
Plug 'junegunn/seoul256.vim'                                   " A colorscheme
" Plug 'ryanoasis/vim-devicons'                                  " Have nice icons attached to files
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
            \  'for': [ 'fennel', 'clojure' ]}
Plug 'justinmk/vim-sneak'                                      " Smart f motions
Plug 'rbong/vim-flog'                                          " Git graph log (integrates with fugitive)
Plug 'joecridge/vim-kinesis', { 'for': 'kinesis' }             " Kinesis syntax files
" Plug 'itchyny/lightline.vim'                                   " Lightweight statusline
" Plug 'macthecadillac/lightline-gitdiff'                        " Git diff integration in lightline
Plug 'Yggdroot/indentLine'                                     " Show indent
Plug 'mbbill/undotree'

" More frustrating that anything..
" 2020-08-25 Well I disabled it for some time and I miss it!
" 2020-10-29 Disabling again, hard to solve conflict with completion.nvim with
" regards to imap <CR>, trying another plugin to see..
" Also this has been unmaintained for quite some years now.
" Plug 'jiangmiao/auto-pairs'                                    " Automatically inserts pairs
Plug 'cohama/lexima.vim'

Plug 'chrisbra/colorizer'                                      " Show colors inline
Plug 'amdt/vim-niji'                                           " Rainbow
Plug 'sirtaj/vim-openscad',
            \ {'for': 'openscad'}
Plug 'guns/vim-sexp'                                           " Clojure
Plug 'jonase/eastwood',                                        " Clojure linting
            \ {'for': 'clojure'}
Plug 'tpope/vim-sexp-mappings-for-regular-people',
            \ {'for': ['clojure', 'fennel']}
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
" Not using this anymore, causes bugs and im not using it that much anyways.
"Plug 't9md/vim-choosewin'                                      " Move between windows & tabs fast
"Plug 'yuki-ycino/fzf-preview.vim'
Plug 'wadackel/vim-dogrun'                                     " Colorscheme
Plug 'raichoo/purescript-vim'
Plug 'dbeniamine/todo.txt-vim'
Plug 'lambdalisue/gina.vim'
Plug 'junegunn/vim-plug'                                       " Just to have the docs
Plug 'neovimhaskell/haskell-vim'                               " Haskell support
Plug 'alx741/vim-stylishask'                                   " Haskell auto prettyfier
" Never works how I expect it to
"Plug 'terryma/vim-expand-region'                               " Expand visual selections
Plug 'elixir-editors/vim-elixir'
Plug 'JMcKiern/vim-venter'
" Messes up the bindings sometimes.
" Eg. in tmux or k9s the binding is not longer intercepted by kitty 
" and passed on to the app instead.
"Plug 'knubie/vim-kitty-navigator'
" Plug 'coreyja/fzf.devicon.vim'
Plug 'norcalli/nvim-colorizer.lua'                            " Show hex color codes
Plug 'danilamihailov/beacon.nvim'                             " Show where the cursor jumped
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'embark-theme/vim', { 'as': 'embark' }
" Plug '~/repos/perso/forks/embark', { 'as': 'embark-pyrho' }

Plug 'folke/tokyonight.nvim'

" wayyyy too slow compared to coc-prettier 
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install',
"   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

Plug 'chrisbra/nrrwrgn'

" Neuron integration
"Plug 'BurntSushi/ripgrep'
" The original maintainer is awol (2020-09-15) fiatjaf's one is better
"Plug 'ihsanturk/neuron.vim'
" Startup bug fixed by MaienM's fork ...
" Plug 'fiatjaf/neuron.vim'
"Plug 'MaienM/neuron.vim', { 'branch': 'patch-1' }
Plug 'chiefnoah/neuron-v2.vim'

Plug '~/repos/perso/nvim-geat'

" Haskell plugin experiment
" Plug 'neovimhaskell/nvim-hs.vim'
" Plug '~/repos/perso/my-nvim-hs'

Plug 'neovim/nvim-lsp'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
"Plug 'mhartington/formatter.nvim'
"Plug 'nvim-lua/lsp-status.nvim'

Plug 'aquach/vim-http-client'
Plug 'tpope/vim-dadbod'
Plug 'kamykn/popup-menu.nvim'

" Fennel > Lua plugin experiment
" Plug 'Olical/aniseed', { 'tag': 'v3.6.2' }
" Plug 'bakpakin/fennel.vim'
" Plug 'Olical/conjure', {'tag': 'v4.4.0'}


" As of 2020-08-24 the state is barely usable
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'norcalli/snippets.nvim'

" Telescop.nvim {{{
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
" }}}

Plug 'kyazdani42/nvim-web-devicons'

Plug 'google/vim-jsonnet'

Plug 'hashivim/vim-terraform'
Plug 'TimUntersberger/neogit'

Plug 'hoob3rt/lualine.nvim', { 'commit': '64ab49f5' }
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'

" Vim Script
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/lsp-trouble.nvim'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'akinsho/nvim-bufferline.lua'

Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'
call plug#end()
