" C# specific settings
"""""""""""""""""""""""""""""""""""""

set nospell

"""""""""""""""""""""""""""""""""""""
" Mappings configuration
"""""""""""""""""""""""""""""""""""""
" OMNISHARP
    " augroup omnisharp_commands
    "     " Clear command group
    "     autocmd!
    "
    "     " Show type information automatically when the cursor stops moving
    "     autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    " augroup END
    "
    " nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    " nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    " nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    " nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    "
    " " Finds members in the current buffer
    " nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    " nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    " nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    " nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    " nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    " inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
    "
    " " Navigate up and down by method/property/field
    " nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    " nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
    "
    " " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    " nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
    " " Run code actions with text selected in visual mode to extract method
    " xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
    "
    " " Rename with dialog
    " nnoremap <Leader>nm :OmniSharpRename<CR>
    " nnoremap <F2> :OmniSharpRename<CR>
    "
    " " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    " command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
    "
    " nnoremap <Leader>cf :OmniSharpCodeFormat<CR>
    "
    " " Start the omnisharp server for the current solution
    " nnoremap <Leader>ss :OmniSharpStartServer<CR>
    " nnoremap <Leader>sp :OmniSharpStopServer<CR>
    "
    " " Add syntax highlighting for types and interfaces
    " nnoremap <Leader>th :OmniSharpHighlightTypes<CR>
" END OMNISHARP

" ALE
    " let b:ale_linters = ['OmniSharp']
    " let b:ale_fixers = ['uncrustify']
" END ALE
