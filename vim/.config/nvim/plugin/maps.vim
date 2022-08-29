let mapleader=" "
nnoremap <SPACE> <Nop>

" better deleting and cutting
nnoremap s "_s

nnoremap d "_d
nnoremap D "_D
xnoremap d "_d
xnoremap D "_D

nnoremap c "_c
nnoremap C "_C
xnoremap c "_c
xnoremap C "_C

nnoremap x "_x
nnoremap X "_x

nnoremap <leader>d d
nnoremap <leader>D D
nnoremap <leader>dd dd
xnoremap <leader>d d
xnoremap <leader>D D

xnoremap p "_dP

nnoremap <leader>p "0p
nnoremap <leader>P "0P

" search for selection
nnoremap <leader>f *N
xnoremap <leader>f "ay/<C-r>a/<CR>N
nnoremap <leader>h <cmd>noh<CR>

" yank to system
" nnoremap <leader>yy "+y
" nnoremap <leader>y "+y
" vnoremap <leader>y "+y
" nmap <leader>Y "+Y


" stuff
nnoremap <leader>V 0vg_
nnoremap <A-a> ggVG


" tree
nnoremap <silent> <leader>e :NvimTreeToggle<CR>


" sourcing
nnoremap <leader>so :so %<CR>
command So so %

function ToggleWrap()
    if (&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunction

nnoremap <leader>w :call ToggleWrap()<CR> 


" better nagivation
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c


" insert mode functionality
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

inoremap <C-a> <ESC>I
inoremap <C-e> <End>

inoremap <A-bs> <C-w>

" window manipulation
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K


" commenting
nnoremap <silent> <A-c> :Commentary<cr>
xnoremap <silent> <A-c> :Commentary<cr>


" line moving
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


" indentation
inoremap <A-h> <C-d>
inoremap <A-l> <C-t>
nnoremap <A-h> <<
nnoremap <A-l> >>
xnoremap <A-h> <gv
xnoremap <A-l> >gv


" swap file
nnoremap <leader>p <C-^>


" scrolling
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>


" remove trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <leader>tw :call TrimWhitespace()<CR>


" telescope config
nnoremap <A-p> <cmd>Telescope git_files<CR>
nnoremap <leader>sf <cmd>Telescope find_files hidden=true<CR>
nnoremap <leader>sg <cmd>Telescope live_grep<CR>
nnoremap <leader>sb <cmd>Telescope buffers<CR>
nnoremap <leader>sh <cmd>Telescope oldfiles<CR>
 
