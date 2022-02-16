" KEYMAPS:

" <Cmd>call <SID>Scroll(arg1, arg2, arg3, arg4)
" arg1 = movement command (eg. 'gg')
" arg2 = length of delay (in ms)
" arg3 = scroll the window (1 for on, 0 for off)
" arg4 = slowdown at the end (1 for on, 0 for off)
" Note: each argument is a string

" paragraph movements
nnoremap <silent> { <Cmd>call <SID>Scroll('{','7','1','1')<CR>
nnoremap <silent> } <Cmd>call <SID>Scroll('}','7','1','1')<CR>
vnoremap <silent> { k<Cmd>call <SID>Scroll('{j','7','1','1')<CR>
vnoremap <silent> } j<Cmd>call <SID>Scroll('}k','7','1','1')<CR>

" half-window movements
nnoremap <silent> <C-u> <Cmd>call <SID>Scroll('<C-u>','7','1','1')<CR>
nnoremap <silent> <C-d> <Cmd>call <SID>Scroll('<C-d>','7','1','1')<CR>
inoremap <silent> <C-u> <Cmd>call <SID>Scroll('<C-u>','7','1','1')<CR>
inoremap <silent> <C-d> <Cmd>call <SID>Scroll('<C-d>','7','1','1')<CR>

" page movements
nnoremap <silent> <C-b> <Cmd>call <SID>Scroll('<C-b>','7','1','1')<CR>
nnoremap <silent> <C-f> <Cmd>call <SID>Scroll('<C-f>','7','1','1')<CR>
nnoremap <silent> <PageUp> <Cmd>call <SID>Scroll('<C-b>','7','1','1')<CR>
nnoremap <silent> <PageDown> <Cmd>call <SID>Scroll('<C-f>','7','1','1')<CR>
inoremap <silent> <PageUp> <Cmd>call <SID>Scroll('<C-b>','7','1','1')<CR>
inoremap <silent> <PageDown> <Cmd>call <SID>Scroll('<C-f>','7','1','1')<CR>

" start and end of file
" nnoremap <silent> gg <Cmd>call <SID>Scroll('gg','2','1','1')<CR>
" nnoremap <silent> G <Cmd>call <SID>Scroll('G','2','1','1')<CR>

" FUNCTIONS:
function! s:Scroll(movement, delay, scrollWin, slowdown)
    let l:pos = getcurpos()[1]
    let l:distance = <SID>MovementDistance(a:movement)
    if l:distance == 0 | return | endif
    let l:counter = 1
    if distance > 0
        " scrolling downwards
        while l:counter <= l:distance
            silent execute("normal! j")
            if a:scrollWin == 1
                if ! (winline() <= &scrolloff + 1 || winline() >= winheight('%') - &scrolloff)
                    silent execute("normal! \<C-E>")
                endif
            endif
            let l:remaining = l:distance - l:counter
            call <SID>SleepDelay(l:remaining, a:delay, a:slowdown)
            let l:counter = <SID>CheckFoldCounter(l:counter)
        endwhile
    else
        " scrolling upwards
        while l:counter <= -l:distance
            silent execute("normal! k")
            if a:scrollWin == 1
                if ! (winline() <= &scrolloff + 1 || winline() >= winheight('%') - &scrolloff)
                    silent execute("normal! \<C-Y>")
                endif
            endif
            let l:remaining = -l:distance - l:counter
            call <SID>SleepDelay(l:remaining, a:delay, a:slowdown)
            let l:counter = <SID>CheckFoldCounter(l:counter)
        endwhile
    endif
endfunction

function! s:CheckFoldCounter(counter)
    let l:counter = a:counter
    let l:foldStart = foldclosed(".")
    if l:foldStart != -1
        let l:foldSize = foldclosedend(l:foldStart) - l:foldStart
        echom l:foldSize
        let l:counter += l:foldSize
    endif
    let l:counter += 1
    return l:counter
endfunction

function! s:MovementDistance(movement)
    let l:winview = winsaveview()
    let l:pos = getcurpos()[1]
    silent execute("normal! " . a:movement)
    let l:newPos = getcurpos()[1]
    let l:distance = l:newPos - l:pos
    call winrestview(l:winview)
    return l:distance
endfunction

function! s:SleepDelay(remaining, delay, slowdown)
    if a:slowdown == 1
        if a:remaining <= 4
            silent execute("sleep " . (a:delay * (5 - a:remaining)) . "m")
        else
            silent execute("sleep " . a:delay . "m")
        endif
    else
        silent execute("sleep " . a:delay . "m")
    endif
    redraw
endfunction