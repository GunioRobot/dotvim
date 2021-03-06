filetype off
"need this before pathogen brings in the bundles
"showmarks clashes with gsessions so we remap
let g:gsession_non_default_mapping = 1

"pathogen settings
let g:pathogen_disabled = []
if v:version < '703' || !has('python')
    call add(g:pathogen_disabled, 'gundo')
endif

if v:version < '702'
    call add(g:pathogen_disabled, 'fuzzyfinder')
    call add(g:pathogen_disabled, 'L9')
endif

call pathogen#infect()
filetype plugin indent on

set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
"set undofile
set number

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

set list
set listchars=tab:▸\ ,eol:¬

"save buffer list in viminfo
set viminfo+=%

nnoremap j gj
nnoremap k gk

"syntax highlighting (colors controlled in .vimrc-local)
syntax on

set tags=./tags;/

"Auto lint check python files
autocmd FileType python compiler pylint
"but dont auto open quickfix window
let g:pylint_cwindow = 0

"Toggle nerdtree with nt
nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"Ack is ack-grep on Ubuntu#
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

"Set ack-grep as grepprg
set grepprg=ack-grep\ --cpp\ --cc\ --perl\ --python\ --make
nnoremap <leader>g :grep <C-R>=expand("<cword>")<CR><CR>

"Tagbar mappings etc
nnoremap <leader>tt :TagbarToggle<cr>
let g:tagbar_left = 1
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1

"showmarks 
"let g:showmarks_enable = 0
let g:showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

"perforce settings
"nnoremap @p4a :!p4 add %:e
"nnoremap @p4e :!p4 edit %:e
"nnoremap @p4d :!p4 diff %
"nnoremap @p4r :!p4 revert %
"let g:p4EnableActiveStatus=0

"Quickfix close/open
nnoremap <leader>qfc :cclose<cr>
nnoremap <leader>qfo :copen<cr>

"bash prompt at current files directory
nnoremap <leader>bp :!cd %:p:h; bash<cr>

"gsession support
let g:autoload_session = 1
nnoremap <leader>gss    :GSessionMakeLocal<CR>
nnoremap <leader>gsS    :GSessionMake<CR>

nnoremap <leader>gsn    :NamedSessionMakeCwd<CR>
nnoremap <leader>gsN    :NamedSessionMake<CR>

nnoremap <leader>gsl    :NamedSessionLoadCwd<CR>
nnoremap <leader>gsL    :NamedSessionLoad<CR>

nnoremap <leader>gse    :GSessionEliminateCurrent<CR>
nnoremap <leader>gsE    :GSessionEliminateAll<CR>

nnoremap <leader>gsm    :GSessionListLocal<CR>

"ack word under cursor
nnoremap <leader>ack :Ack <C-R><C-W><CR>

"json tidy
map <leader>jayson  <Esc>:%!json_xs -f json -t json-pretty<CR>

"css tidy (doesnt work)
"map <leader>css  <Esc>:!csslint-0.6 %<CR>

" Perl support
" perlcritic stern
let g:Perl_PerlcriticSeverity = 4

"Gundo tree toggle
nnoremap <leader>ut :GundoToggle<CR>

"local (non-github public) settings
source ~/.vimrc-local

"jekyll mappings
map <Leader>jb  :JekyllBuild<CR>
map <Leader>jn  :JekyllPost<CR>
map <Leader>jl  :JekyllList<CR>

"bufexplorer settings
let g:bufExplorerShowRelativePath = 1

"clear search hightlighting on esc
"nnoremap <esc> :noh<return><esc>

"fswitch mapping
nmap <silent> <Leader>ss :FSHere<cr>

"show me whitespace problems
let c_space_errors=1

"force terminal colours
set t_Co=256

"buffersaurus
map ]g :Bsnext<CR>
map [g :Bsprev<CR>

"vim-pad mappings (\n in insert mode is crazy)
let g:pad_use_default_mappings = 0

nmap <leader>nl :ListPads<CR>
nmap <leader>nn :OpenPad<CR>
nmap <leader>ns :SearchPads<CR>

