" LateX specific settings
"""""""""""""""""""""""""""""""""""""
set spell

"""""""""""""""""""""""""""""""""""""
" Mappings configuration
"""""""""""""""""""""""""""""""""""""
" ALE
    let b:ale_linters = ['lacheck']
    let b:ale_fixers = ['latexindent']
" END ALE

" VIMTEX
    let g:tex_flavor = 'latex'
    let g:vimtex_view_method = 'skim'
" END VIMTEX

" START INDENTLINE
let g:indentLine_enabled = 0
" END INDENTLINE
