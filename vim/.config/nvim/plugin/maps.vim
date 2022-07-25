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

nnoremap <leader>x dd
nnoremap <leader>X D

xnoremap p "_dP


" yank to system
nnoremap <leader>yy "+y
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y


" stuff
nnoremap <leader>V 0vg_
nnoremap <leader>* *N
nnoremap <A-a> ggVG


" tree
nnoremap <silent> <leader>e :NvimTreeToggle<CR>


" sourcing
nnoremap <leader><CR> :so $MYVIMRC<CR>
nnoremap <leader>so :so %<CR>

nnoremap <leader>w :w<CR>


" better nagivation
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-c> <C-w>c


" insert mode functionality
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

inoremap <C-a> <ESC>I
inoremap <C-e> <End>

inoremap <A-Bs> <C-w>


" window manipulation
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K


" commenting
nnoremap <silent> <C-_> :Commentary<cr>
xnoremap <silent> <C-_> :Commentary<cr>
nnoremap <silent> <leader>/ :Commentary<cr>
xnoremap <silent> <leader>/ :Commentary<cr>


" line moving
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

inoremap <A-[> <C-d>
inoremap <A-]> <C-t>

nnoremap <leader>[ <<
nnoremap <A-[> <<
nnoremap <leader>] >>
nnoremap <A-]> >>
xnoremap <leader>[ <gv
xnoremap <A-[> <gv
xnoremap <leader>] >gv
xnoremap <A-[> >gv


" remove trailing whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <leader>tw :call TrimWhitespace()<CR>


" lsp config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gf <cmd>lua vim.diagnostic.open_float()<CR>
" nnoremap <silent> gp <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" nnoremap <silent> gn <cmd>lua vim.lsp.diagnostic.goto_next()<CR>


" telescope config
nnoremap <A-p> <cmd>Telescope git_files<CR>
nnoremap <leader>sf <cmd>Telescope find_files hidden=true<CR>
nnoremap <leader>sg <cmd>Telescope live_grep<CR>
nnoremap <leader>sb <cmd>Telescope buffers<CR>
nnoremap <leader>sh <cmd>Telescope oldfiles<CR>
 
