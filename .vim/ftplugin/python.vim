" Python specific settings
"""""""""""""""""""""""""""""""""""""
set nospell
set foldmethod=indent
set foldlevel=999

"""""""""""""""""""""""""""""""""""""
" Mappings configuration
"""""""""""""""""""""""""""""""""""""
" ALE
    " Check Python files with pylint.
    let b:ale_linters = ['pylint']

    " Fix Python files with yapf.
    let b:ale_fixers = ['yapf']

    let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
    nnoremap <silent>gf :ALEFix<CR>
" END ALE
