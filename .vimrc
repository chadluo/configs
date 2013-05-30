" ======== General ======== 
set nocompatible
set history=200
set encoding=utf-8
autocmd! bufwritepost .vimrc source ~/.vimrc

" ======== Interface ======== 
set ruler
set number
set wildmenu
set wildignore=*.0,*~,*.pyc,*.class
set whichwrap+=<,>,h,l
set scrolloff=8
set nowrap
set mouse=a
set laststatus=2
set backspace=indent,eol,start

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

" ======== Mapleader ======== 
let mapleader=","
let maplocalleader=","
let g:mapleader=","
set notimeout
set ttimeout

"" split
nnoremap <leader>s :split<CR>

"" clearing highlighted search
noremap <silent> <leader><ESC> :nohlsearch<CR>
vnoremap <silent> <leader><ESC> :nohlsearch<CR>
inoremap <silent> <leader><ESC> :nohlsearch<CR>

"" save as root
nnoremap <leader>w <ESC>:w !sudo tee % > /dev/null<CR>

"" syntastic check
nnoremap <leader>c <ESC>:SyntasticCheck<CR>
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': [] }

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

" walk through windows
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" ======== trival ========

" fcitx support
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction
autocmd InsertLeave * call Fcitx2en()

" Pathogen
runtime! autoload/pathogen.vim
silent! call pathogen#helptags()
silent! call pathogen#runtime_append_all_bundles()
execute pathogen#infect()

" Omni Completion
"set omnifunc=syntaxcomplete#Complete
if has("autocmd")
    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
    autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo
endif
"setlocal omnifunc=javacomplete#Complete
"setlocal completefunc=javacomplete#CompleteParamsInfo
"if has("autocmd")
"    autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"endif
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P> 

" remember last cursor location
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" remember info about open buffers on close
set viminfo^=%
