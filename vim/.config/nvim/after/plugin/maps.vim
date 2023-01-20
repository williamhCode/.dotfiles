let mapleader=" "
let maplocalleader=" "
nnoremap <SPACE> <Nop>

" better deleting and cutting
" nnoremap d "_d
" nnoremap D "_D
" xnoremap d "_d
" xnoremap D "_D

" nnoremap c "_c
" nnoremap C "_C
" xnoremap c "_c
" xnoremap C "_C

" nnoremap x d
" nnoremap X D
" nnoremap xx dd

" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" xnoremap <leader>p "+p
" xnoremap <leader>P "+P

" nnoremap <leader>y "+y
" nnoremap <leader>Y "+Y
" xnoremap <leader>y "+y
" xnoremap <leader>Y "+Y

" replacing
" function! SetupCR()
"   nnoremap <Enter> :nnoremap <lt>Enter> n@z<CR>q:<C-u>let @z=strpart(@z,0,strlen(@z)-1)<CR>n@z
" endfunction

" nnoremap cq :call SetupCR()<CR>*``qz
" nnoremap cQ :call SetupCR()<CR>#``qz

" xnoremap <expr> <leader>cq ":\<C-u>call SetupCR()\<CR>" . "gv" . g:mc . "``qz"
" xnoremap <expr> <leader>cQ ":\<C-u>call SetupCR()\<CR>" . "gv" . substitute(g:mc, '/', '?', 'g') . "``qz"

" search for selection
" nnoremap <silent> <leader>n :noh<CR>

" stuff
" nnoremap <M-s>a ggVG

" tree
" nmap <silent> <M-s>b :NvimTreeToggle<CR>
" command TF :NvimTreeFindFile
" command TCB :NvimTreeClipboard
" command TCL :NvimTreeCollapseKeepBuffers

" sourcing
nnoremap <leader>o :so %<CR>

function ToggleWrap()
    if (&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunction

nnoremap <leader>w :call ToggleWrap()<CR>

" window
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

nnoremap <silent> <C-c> <C-w>c

" indentation
inoremap <M-s>[ <C-d>
inoremap <M-s>] <C-t>
nnoremap <M-s>[ <<
nnoremap <M-s>] >>
xnoremap <M-s>[ <gv
xnoremap <M-s>] >gv

" scrolling
noremap <ScrollWheelUp> <C-y>
noremap <S-ScrollWheelUp> <C-u>
noremap <ScrollWheelDown> <C-e>
noremap <S-ScrollWheelDown> <C-d>


" remove trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" nnoremap <leader>tw :call TrimWhitespace()<CR>
command TW :call TrimWhitespace()

" terminal config
tnoremap <Esc> <C-\><C-n>

" centered jumping
function! ScrollUp()
    set scrolloff=0
    execute 'normal! ' . "20\<C-u>"
    set scrolloff=8
endfunction

function! ScrollDown()
    set scrolloff=0
    execute 'normal! ' . "20\<C-d>"
    set scrolloff=8
endfunction

nnoremap <silent> <C-u> :call ScrollUp()<CR>zz
nnoremap <silent> <C-d> :call ScrollDown()<CR>zz

" tagbar
nmap <silent> <M-b> :TagbarToggle<CR>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <leader>css :call SynStack()<CR>

