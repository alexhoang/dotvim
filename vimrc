let g:pathogen_disabled = []
call add(g:pathogen_disabled, 'nerdtree')
call add(g:pathogen_disabled, 'nerdtreetabs')

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
set nopaste
syntax on
imap ii <Esc>

if has("autocmd")
    filetype plugin indent on
endif

map <F2> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=1

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim-swap, ~/tmp or .
if isdirectory($HOME . '/.vim-swap') == 0
  :silent !mkdir -p ~/.vim-swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim-swap//
set directory+=~/tmp//
set directory+=.

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap, uses .vim-undo first, then ~/.vim-undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim-undo') == 0
    :silent !mkdir -p ~/.vim-undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim-undo//
  set undofile
endif
