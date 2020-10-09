"""""""""""""""""""""""""""""""""""""
" Making window swapping easy
"""""""""""""""""""""""""""""""""""""
function! SwapWindowBuffers()
    if !exists("g:markedWinNum")
        " set window marked for swap
        let g:markedWinNum = winnr()
        exe ':windo if &buftype != "quickfix" | lclose | endif'
    else
        " mark destination
        let curNum = winnr()
        let curBuf = bufnr( "%" )
        if g:markedWinNum == curNum
            :echo "window unmarked for swap"
        else
            exe g:markedWinNum . "wincmd w"
            " switch to source and shuffle dest->source
            let markedBuf = bufnr( "%" )
            " hide and open so that we aren't prompted and keep history
            exe 'hide buf' curBuf
            " switch to dest and shuffle source->dest
            exe curNum . "wincmd w"
            " hide and open so that we aren't prompted and keep history
            exe 'hide buf' markedBuf
            :echo "windows swapped"
        endif
        " unset window marked for swap
        unlet g:markedWinNum
    endif
endfunction

nmap <silent> <leader>mw :call SwapWindowBuffers()<CR>
