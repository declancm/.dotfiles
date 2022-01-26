command! Code :call OpenInCode()

function! OpenInCode()
    let l:file = bufname(0)
    let l:fullpath = fnamemodify(l:file, ":p")
    silent execute("!code -r " . l:fullpath)
endfunction
