let mapleader=" "

nnoremap <SPACE> <Nop>

" better deleting and cutting
nnoremap d "_d
nnoremap D "_D
xnoremap d "_d
xnoremap D "_D

nnoremap c "_c
nnoremap C "_C
xnoremap c "_c
xnoremap C "_C

nnoremap x d
nnoremap X D
nnoremap xx dd

nnoremap <leader>p "0p
nnoremap <leader>P "0P
xnoremap <leader>p "0p
xnoremap <leader>P "0P

" search for selection
nnoremap <silent> <leader>n :noh<CR>

" yank to system
" nnoremap <leader>yy "+y
" nnoremap <leader>y "+y
" vnoremap <leader>y "+y
" nmap <leader>Y "+Y

" stuff

nnoremap <leader>V ^vg_
nnoremap <M-a> ggVG

" tree
nmap <silent> <M-n> :NvimTreeToggle<CR>
command TF :NvimTreeFindFile
command TCB :NvimTreeClipboard
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

inoremap <M-bs> <C-w>

" window
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

nnoremap <silent> <C-c> <C-w>c

" indentation
inoremap <M-h> <C-d>
inoremap <M-l> <C-t>
nnoremap <M-h> <<
nnoremap <M-l> >>
xnoremap <M-h> <gv
xnoremap <M-l> >gv

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
nmap <M-b> :TagbarToggle<CR>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <leader>css :call SynStack()<CR>

