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

xnoremap p "_dP

" nnoremap <leader>p "0p
" nnoremap <leader>P "0P

if exists("g:neovide")
    inoremap <D-v> <C-r>+
    nmap <D-v> p
endif

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
nnoremap <silent> <leader>tf :NvimTreeFindFile<CR>
command TF :NvimTreeFindFile
command TCB :NvimTreeClipboard
" command TCL :NvimTreeCollapseKeepBuffers


" sourcing
nnoremap <leader>so :so %<CR>
command SO so %

function ToggleWrap()
    if (&wrap == 1)
        set nowrap
    else
        set wrap
    endif
endfunction

nnoremap <leader>w :call ToggleWrap()<CR> 


" insert mode functionality
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

inoremap <C-a> <ESC>I
inoremap <C-e> <End>

inoremap <A-bs> <C-w>

" window
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

nnoremap <silent> <C-c> <C-w>c

map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K


" commenting
if exists("g:neovide")
    nnoremap <silent> <D-/> :Commentary<cr>
    xnoremap <silent> <D-/> :Commentary<cr>
else
    nnoremap <silent> <A-c> :Commentary<cr>
    xnoremap <silent> <A-c> :Commentary<cr>
endif


" line moving
nnoremap <silent> <A-k> :m .-2<CR>==
nnoremap <silent> <A-j> :m .+1<CR>==
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv

" indentation
if exists("g:neovide")
    inoremap <D-[> <C-d>
    inoremap <D-]> <C-t>

    inoremap <D-[> <C-d>
    nnoremap <D-[> <<
    nnoremap <D-]> >>
    xnoremap <D-[> <gv
    xnoremap <D-]> >gv
else
    inoremap <A-h> <C-d>
    inoremap <A-l> <C-t>

    inoremap <A-h> <C-d>
    nnoremap <A-h> <<
    nnoremap <A-l> >>
    xnoremap <A-h> <gv
    xnoremap <A-l> >gv
endif

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
" nnoremap <A-p> <cmd>Telescope git_files<CR>
lua << EOF
function _G.better_find_files(opts)
    opts = opts or {}
    -- we only want to do it if we have a gitignore and no .git dir
    if vim.fn.filereadable(".gitignore") == 1 and vim.fn.isdirectory(".git/") == 0 then
        opts.find_command = { "rg", "--files", "--ignore-file", ".gitignore" }
    end
    require("telescope.builtin").find_files(opts)
end
EOF
nnoremap <leader>sf <cmd>lua better_find_files()<CR>
nnoremap <leader>sg <cmd>Telescope live_grep<CR>
nnoremap <leader>sb <cmd>Telescope buffers<CR>
nnoremap <leader>sh <cmd>Telescope oldfiles<CR>
 

" terminal config
tnoremap <Esc> <C-\><C-n>

:echo "Hello, world!"

" centered jumping
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" better word moving
" nnoremap <silent> <leader>w :call search('\<\w', 'W')<cr>
" nnoremap <silent> <leader>e :call search('\w\>', 'W')<cr>
" nnoremap <silent> <leader>b :call search('\<\w', 'bW')<cr>
" nnoremap <silent> <leader>gE :call search('\w\>', 'bW')<cr>
