" Startify config {{{
let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'commands',  'header': ['   Commands']       },
            \ ]

let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
            \ { 'w': '~/SynologyDrive/wikis/vimwiki/index.md' },
            \ { 't': '~/.config/nvim/conf' },
            \ { 'r': '~/repos' },
            \ { 'z': '~/rc/zsh' },
            \ ]
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
"let g:startify_custom_header = 'map(startify#fortune#boxed() + g:asciidashlane2, "\"   \".v:val")'
"
"let g:startify_custom_header =
        "\ map(split(system('fortune | cowsay -f stegosaurus'), '\n'), '"   ". v:val')
let g:startify_change_to_vcs_root = 1

" }}}

