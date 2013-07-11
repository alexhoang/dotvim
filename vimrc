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
set switchbuf+=usetab,newtab
set ignorecase
set smartcase
set incsearch
set hlsearch
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

"Rename tabs to show tab# and # of viewports
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= (i== t ? '%#TabNumSel#' : '%#TabNum#')
            let s .= i
            if tabpagewinnr(i,'$') > 1
                let s .= '.'
                let s .= (i== t ? '%#TabWinNumSel#' : '%#TabWinNum#')
                let s .= (tabpagewinnr(i,'$') > 1 ? wn : '')
            end

            let s .= ' %*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= file
            let s .= (i == t ? '%m' : '')
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
endif

