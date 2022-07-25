" let g:netrw_banner = 0
" let g:netrw_winsize = -30
" let g:netrw_list_hide = '.DS_Store'

" let g:NetrwIsOpen = 0
" let g:CurrWin = 0

" function! ToggleLexplore()
"     let g:netrw_winsize = -30
"     if g:NetrwIsOpen
"         silent Lexplore
"         execute g:CurrWin . 'wincmd w'
"         let g:NetrwIsOpen = 0
"     else
"         let g:CurrWin = winnr()
"         let path = expand('%:p:h')
"         silent exec 'Lexplore '. path
"         let g:netrw_chgwin = g:CurrWin + 1
"         let g:NetrwIsOpen = 1
"     endif
" endfunction


" augroup netrw_mapping
"   autocmd!
"   autocmd filetype netrw call NetrwMapping()
" augroup END

" function! NetrwMapping()
"   nnoremap <silent> <buffer> <c-l> :wincmd l<cr>
" endfunction

" autocmd FileType netrw setl bufhidden=wipe
