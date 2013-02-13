call pathogen#infect()
call pathogen#helptags()
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
set autoindent
set copyindent
set showmatch
set history=1000
set undolevels=1000
syntax on

if has("autocmd")
    filetype plugin indent on
endif

map <F2> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1
