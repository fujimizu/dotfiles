"--------------------------------------------------------------------
" dein
"--------------------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('thinca/vim-quickrun')
  call dein#add('jakedouglas/exuberant-ctags')
  call dein#add('Markdown')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('tpope/vim-fugitive')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"--------------------------------------------------------------------
" japanese
"--------------------------------------------------------------------
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac

"--------------------------------------------------------------------
" misc settings
"--------------------------------------------------------------------
set nocompatible
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
let g:airline_powerline_fonts = 1

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
" jedi
"--------------------------------------------------------------------
"let g:jedi#auto_vim_configuration = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 0
let g:jedi#rename_command = '<Leader>R'
