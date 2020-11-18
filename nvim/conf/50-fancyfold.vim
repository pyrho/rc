" Fancier folding from Matias' conf {{{
set fillchars=fold:─
function! NeatFoldText()
    let line = getline(v:foldstart)
    " Tries to detect if this is an elixir documentation block so we fold it nicely
    let grps  = matchlist(line, '\(@\a*\) """')
    if len(grps) > 0
        let doc_type = grps[1]
        let linenum = v:foldstart + 1
        if linenum < v:foldend
            let line = substitute(getline(linenum), '^[ \t]*\(.*\)$', doc_type . ': \1', 'g')
        end
    end

    let foldchar         = matchstr(&fillchars, 'fold:\zs.')
    let lines_count      = v:foldend - v:foldstart + 1
    let lines_count_text = printf("── %1s  ──", lines_count) . repeat(foldchar, 10)
    let foldtextstart    = repeat(' ', indent(nextnonblank(v:foldstart))) . line . " ──"
    let foldtextend      = lines_count_text . repeat(foldchar, 8)
    let foldtextlength   = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn

    return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
endfunction

set foldtext=NeatFoldText()
" }}}
