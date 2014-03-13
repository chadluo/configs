" ======== General ========
set nocompatible
set history=200
set fileencodings=utf-8,gb2312,gbk,cp936
set termencoding=utf-8
set enc=utf-8
set encoding=utf-8
set clipboard=unnamed
set autowrite
set updatecount=50
autocmd! bufwritepost .vimrc source ~/.vimrc

" ======== Interface ========
set ruler
set number
set wildmenu
set wildignore=*.0,*~,*.pyc,*.class
set wildmode=longest,list,full
set whichwrap+=<,>,h,l
set ttyfast
set lazyredraw
set nowrap
set noshowmode
set mouse=a
set laststatus=2
set backspace=indent,eol,start
fixdel
let t_Co=256

" bell
set noerrorbells
set visualbell
set t_vb=
set tm=500

" split
set splitbelow
set splitright

" ==== Folding ====
nnoremap <leader>f za
onoremap <leader>f <C-C>za
" open all folds
nnoremap <leader>F zR
onoremap <leader>F <C-C>zR
set foldmethod=indent
set nofoldenable

" ==== highlight ====
syntax on
colorscheme mBusyBee
set t_co=256
highlight OverLength ctermbg=black
match OverLength /\%81v.\+/
highlight LineEndSpaces ctermbg=yellow
match LineEndSpaces /\s\+$/

" ======== Search ========
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" ======== File ========
set nobackup
set nowritebackup
set noswapfile
set showcmd
set autoread " auto reload when file changed

" ======== Indent ========
set autoindent
set cindent
set smartindent
set wrap
autocmd FileType * set tabstop=4|set softtabstop=4|set shiftwidth=4
autocmd FileType yaml,html set tabstop=2|set softtabstop=2|set shiftwidth=2
set expandtab
set smarttab

" ======== Operation ========

" Navi
map j gj
map k gk

" walk through windows
nmap <C-h> :wincmd h<CR>
nmap <C-l> :wincmd l<CR>
nmap <C-j> :wincmd j<CR>
nmap <C-k> :wincmd k<CR>

" move under insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Move a line/lines of text using ALT+[jk]
" <Meta> not working under rxvt
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" tab for matching braces
nnoremap <tab> %
vnoremap <tab> %

" jump to begin/end of line
noremap H ^
noremap L $

" ======== NeoBundle ========

if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

" navigation
NeoBundle 'EasyMotion'
" ,,j / ,,k
NeoBundle 'kshenoy/vim-signature'
" m[a-zA-Z]    : Toggle mark
" m<Space>     : Delete all marks
" m,           : Place the next available mark
" ]`           : Jump to next mark
" [`           : Jump to prev mark
" ]'           : Jump to start of next line containing a mark
" ['           : Jump to start of prev line containing a mark
" `]           : Jump by alphabetical order to next mark
" `[           : Jump by alphabetical order to prev mark
" ']           : Jump by alphabetical order
"                to start of next line containing a mark
" '[           : Jump by alphabetical order
"                to start of prev line containing a mark
" m[0-9]       : Toggle the corresponding marker !@#$%^&*()
" m<S-[0-9]>   : Remove all markers of the same type
" ]-           : Jump to next line having same marker
" [-           : Jump to prev line having same marker
" m<BackSpace> : Remove all markers

" syntax
NeoBundle 'Markdown'
NeoBundle 'yaml.vim'
NeoBundle 'TagHighlight'

" enhancement
NeoBundle 'Emmet.vim'
NeoBundle 'tpope/vim-fugitive'
" :Git, git []
" :Gstatus, git status
" :Gcommit, git commit
" :Gdiff, git diff
" :Glog, git log file
" :Ge, e file
" :Gread, git checkout file
" :Gwrite, git add file
NeoBundle 'godlygeek/tabular'
" :Tab/=
NeoBundle 'The-NERD-Commenter'
" ,c<space> toggle comment
NeoBundle 'matchit.zip'
NeoBundle 'bling/vim-airline'
NeoBundle 'ctags.vim'

" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

filetype plugin indent on
NeoBundleCheck

" ==== Mapleader ====
let mapleader      = ","
let maplocalleader = ","
let g:mapleader    = ","
set notimeout
set ttimeout
" may cause problem for <ESC> exit INSERT to NORMAL under xterm
" use <C-C> instead

"" split
nnoremap <leader>s :split<CR>

"" clearing highlighted search
noremap <leader><ESC> :nohlsearch<CR>

"" save as root
nnoremap <leader>w :w !sudo tee % > /dev/null<CR>

" ==== airline ====
let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#checks = [ 'trailing' ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'

" ======== trival ========

" zencoding(emmet)
let g:user_emmet_expandabbr_key = '<c-y>'
let g:user_emmet_settings = {
            \  'indentation' : '  ',
            \  'perl' : {
            \    'aliases' : {
            \      'req' : 'require '
            \    },
            \    'snippets' : {
            \      'use' : "use strict\nuse warnings\n\n",
            \      'warn' : "warn \"|\";",
            \    }
            \  }
            \}

" turn off fcitx when exit INSERT
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
autocmd InsertLeave * call Fcitx2en()

" strip trailing whitespace
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" indent all
noremap <leader>= gg=G

" remember last cursor location
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" remember info about open buffers on close
set viminfo^=%
