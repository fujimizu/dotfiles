"--------------------------------------------------------------------
" vim-plug
"--------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'thinca/vim-quickrun'
Plug 'vim-scripts/Markdown'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-goimports'
call plug#end()

"--------------------------------------------------------------------
" japanese
"--------------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

"--------------------------------------------------------------------
" misc settings
"--------------------------------------------------------------------
filetype plugin indent on
syntax enable

set incsearch
set hlsearch
set nobackup
set laststatus=2
set autoindent
set smartindent
set ignorecase
set smartcase
set wrapscan
set ruler
set nolist
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set showmatch
set splitbelow
set splitright
set cursorline
set autoread

colorscheme jellybeans

set showcmd
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.(&bomb?':BOM':'').']'}%y%=%l,%c%V%8P
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest

set clipboard+=unnamed

"--------------------------------------------------------------------
" ChagenLog
"--------------------------------------------------------------------
let g:changelog_timeformat = "%Y-%m-%d"
let g:changelog_username = "Mizuki Fujisawa  <fujisawa@bayon.cc>"

"--------------------------------------------------------------------
" templates
"--------------------------------------------------------------------
autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

"--------------------------------------------------------------------
" white space
"--------------------------------------------------------------------
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"--------------------------------------------------------------------
" filetypes
"--------------------------------------------------------------------
autocmd FileType cpp :set tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType c :set tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType java :set tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType python :set tabstop=4 shiftwidth=4 softtabstop=0
autocmd FileType html :set tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType javascript :set tabstop=2 shiftwidth=2 softtabstop=0
autocmd FileType python :inoremap # X#
autocmd FileType changelog :set formatoptions=q

"--------------------------------------------------------------------
" Automatically set permissions for files with shebang
"--------------------------------------------------------------------
function MakeScriptExecutable()
    if getline(1) =~ "^#!.*/bin/"
        silent !chmod +x <afile>
    endif
endfunction

au BufWritePost * call MakeScriptExecutable()

"--------------------------------------------------------------------
" airline
"--------------------------------------------------------------------
"let g:airline_left_sep=''
"let g:airline_right_sep=''
set laststatus=2
set t_Co=256
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts = 0

"--------------------------------------------------------------------
" quickrun
"--------------------------------------------------------------------
let g:quickrun_config = {
    \   "_" : {
    \       "runner" : "vimproc",
    \       "runner/vimproc/updatetime" : 60
    \   },
\}

"--------------------------------------------------------------------
" ctrlp
"--------------------------------------------------------------------
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_lazy_update = 1
let g:ctrlp_cmd = "CtrlPMRU"
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }


"--------------------------------------------------------------------
" asyncomplete
"--------------------------------------------------------------------
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

"--------------------------------------------------------------------
" vim-lsp python
"--------------------------------------------------------------------
let g:lsp_diagnostics_echo_cursor = 1

"--------------------------------------------------------------------
" vim-goimports
"--------------------------------------------------------------------
let g:goimports_simplify = 1
