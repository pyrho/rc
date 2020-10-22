" From  https://habamax.github.io/2019/09/02/use-vim-dadbod-to-query-databases.html
let g:dadbods = []

let db = {
		\"name": "Local",
		\"url": "postgresql://postgres@localhost:5432/postgres"
		\}

call add(g:dadbods, db)
let db = {
		\"name": "AM Staging",
		\"url": "postgres://$DO_DB_USER:$DO_DB_PASSWORD@$DO_DB_URL:25060/staging"
		\}

call add(g:dadbods, db)

let db = {
		\"name": "AM Prod",
		\"url": "postgres://$DO_DB_USER:$DO_DB_PASSWORD@$DO_DB_URL:25060/production"
		\}

call add(g:dadbods, db)

" if g:db and b:db is set up -- b:db will be used.
" so g:db would serve as a default database (first in the list)
let g:db = g:dadbods[0].url

func! s:DBSelected(selected)
    for entry in g:dadbods
        if entry.name == a:selected
            let b:db = entry.url
            echomsg 'DB ' . entry.name . ' is selected.'
            break
        endif
    endfor
endfunc

command! DBSelect :call popup_menu#open(map(copy(g:dadbods), {k,v -> v.name}), {selected -> s:DBSelected(selected)})

nmap <expr> <leader>d db#op_exec()
xmap <expr> <leader>d db#op_exec()

" sql query text object (from https://github.com/tpope/vim-dadbod/issues/33)
vnoremap aq <esc>:call search(";", "cWz")<cr>:call search(";\\<bar>\\%^", "bsWz")<cr>:call search("\\v\\c^(select<bar>with<bar>insert<bar>update<bar>delete<bar>create)\>", "Wz")<cr>vg`'
omap aq :normal vaq<cr>
