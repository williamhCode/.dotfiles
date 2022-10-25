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

if exists("g:neovide")
    inoremap <D-v> <C-r>+
    nmap <D-v> p
endif

" search for selection
nnoremap <leader>f *N
xmap <leader>f *N
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
" nnoremap <silent> <leader>tf :NvimTreeFindFile<CR>
command TF :NvimTreeFindFile
command TCB :NvimTreeClipboard
" command TCL :NvimTreeCollapseKeepBuffers


" sourcing
nnoremap <leader>so :so $MYVIMRC<CR>

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

inoremap <M-bs> <C-w>

" window
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

nnoremap <silent> <C-c> <C-w>c

" map <leader>th <C-w>t<C-w>H
" map <leader>tk <C-w>t<C-w>K


" commenting
if exists("g:neovide")
    nnoremap <silent> <D-/> :Commentary<cr>
    xnoremap <silent> <D-/> :Commentary<cr>
else
    nnoremap <silent> <M-c> :Commentary<cr>
    xnoremap <silent> <M-c> :Commentary<cr>
endif


" line moving
nnoremap <silent> <M-k> :m .-2<CR>==
nnoremap <silent> <M-j> :m .+1<CR>==
vnoremap <silent> <M-k> :m '<-2<CR>gv=gv
vnoremap <silent> <M-j> :m '>+1<CR>gv=gv

" indentation
if exists("g:neovide")
    inoremap <D-[> <C-d>
    inoremap <D-]> <C-t>
    nnoremap <D-[> <<
    nnoremap <D-]> >>
    xnoremap <D-[> <gv
    xnoremap <D-]> >gv
else
    inoremap <M-h> <C-d>
    inoremap <M-l> <C-t>
    nnoremap <M-h> <<
    nnoremap <M-l> >>
    xnoremap <M-h> <gv
    xnoremap <M-l> >gv
endif

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


" telescope config
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

" centered jumping
function! ScrollUp()
    set scrolloff=0
    execute 'normal! ' . "\<C-u>"
    set scrolloff=8
endfunction

function! ScrollDown()
    set scrolloff=0
    execute 'normal! ' . "\<C-d>"
    set scrolloff=8
endfunction

nnoremap <silent> <C-u> :call ScrollUp()<CR>zz
nnoremap <silent> <C-d> :call ScrollDown()<CR>zz

lua << EOF
local nnoremap = require("keymap").nnoremap

local silent = { silent = true }

nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<leader>h", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>j", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>k", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>l", function() require("harpoon.ui").nav_file(4) end, silent)
EOF

" tagbar
nmap <M-b> :TagbarToggle<CR>

