" ======== General ========
set nocompatible
set history=200
set encoding=utf-8
autocmd! bufwritepost .vimrc source ~/.vimrc

" ======== Vundle ========
filetype off " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc() " required! let Vundle manage Vundle
Bundle 'gmarik/vundle'
" vim-scripts repos
filetype plugin indent on " required

Bundle 'AutoClose'
Bundle 'EasyMotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Markdown'
Bundle 'The-NERD-tree'

" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" ======== Interface ========
set ruler
set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
set wildmenu
set wildignore=*.0,*~,*.pyc,*.class
set whichwrap+=<,>,h,l
set scrolloff=4
set nowrap
set mouse=a
set laststatus=2
set backspace=indent,eol,start
fixdel

" bell
set noerrorbells
set visualbell
set t_vb=
set tm=500

" ======== Folding ========
nnoremap <leader>f za
onoremap <leader>f <C-C>za
" open all folds
nnoremap <leader>F zR
onoremap <leader>F <C-C>zR
set foldmethod=indent
set nofoldenable

" ======== highlight ========
filetype plugin indent on
syntax on
colorscheme BusyBee
set background=dark
set t_co=256
highlight OverLength ctermbg=black
match OverLength /\%81v.\+/

" ======== Search ========
set hlsearch
set incsearch
set ignorecase
set smartcase

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" ======== Operation ========

" Navi 
map j gj
map k gk

" Select all
" map <C-a> ggvG
map <C-a> gg=G

" walk through windows
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>

" move under insert mode
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" tab for matching braces
nnoremap <tab> %
vnoremap <tab> %

" ==== Mapleader ====
let mapleader=","
let maplocalleader=","
let g:mapleader=","
set notimeout
set ttimeout
" may cause problem for <ESC> exit INSERT to NORMAL
" use <C-C> instead

"" split
nnoremap <leader>s :split<CR>

"" clearing highlighted search
noremap <silent> <leader><ESC> :nohlsearch<CR>
"" save as root
nnoremap <leader>q :w !sudo tee % > /dev/null<CR>

"" NERDTree
nnoremap <leader>n :NERDTree<CR>
" o - open/close file or dir
" t - open in new tab
" T - open in background tab
" ! - execute
" p - upper directory
" P - root directory
" K - first node
" J - last node
" u - open upper directory
" m - filesystem menu
" ? - help
" q - quit
" r - refresh
" <C-w>h/j/k/l

" ======== trival ========

" turn off fcitx when exit INSERT
autocmd InsertLeave * call Fcitx2en()
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

" Omni Completion
set omnifunc=syntaxcomplete#Complete
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif
inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

" remember last cursor location
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" remember info about open buffers on close
set viminfo^=%
