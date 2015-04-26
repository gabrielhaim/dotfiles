" Vim Configuration file"
" vimrc for python IDE and javascript use"
" Gabriel Haim"

" Vundle plugin manager
" ---------------------
set nocompatible             " be iMproved, required
filetype off                 " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                " Vundle installer
Plugin 'mileszs/ack.vim'                  " Ack in-file search
Plugin 'tpope/vim-fugitive'               " Best git wrapper
Plugin 'kien/ctrlp.vim'                   " Fuzzy search
Plugin 'plasticboy/vim-markdown'          " .md files
Plugin 'sjl/gundo.vim'                    " Undo tree
Plugin 'Lokaltog/powerline'               " Status line
Plugin 'Valloric/YouCompleteMe'           " Auto complete on steroids
Plugin 'rking/ag.vim'                     " Silver searcher (replace ack?)
Plugin 'jelera/vim-javascript-syntax'     " Better javascript
Plugin 'mattn/emmet-vim'                  " Web snippets
Plugin 'othree/html5.vim'                 " HTML5 omnicomplete and syntax
Plugin 'alfredodeza/pytest.vim'           " py.test
Plugin 'jmcantrell/vim-virtualenv'        " Set path to virtualenv
Plugin 'tpope/vim-surround'               " Surround ([{..
Plugin 'rodjek/vim-puppet'                " Puppet syntax
Plugin 'gabrielhaim/vim-colors-solarized' " Nice colors
Plugin 'scrooloose/syntastic'             " Syntax checker
Plugin 'kchmck/vim-coffee-script'         " Coffeescript swiss tool
Plugin 'mustache/vim-mustache-handlebars' " Handlebars
Plugin 'groenewege/vim-less'              " Less
Plugin 'vim-scripts/Align'                " SQL dependency
Plugin 'vim-scripts/SQLUtilities'         " SQL Formatter and tools
Plugin 'tpope/vim-vinegar'                " Better directory viewer
Plugin 'elzr/vim-json'                    " Better JSON syntax
Plugin 'tpope/vim-fireplace'              " Clojure plugin
Plugin 'fatih/vim-go'                     " Better go

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Powerline setup
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Folding"
set foldmethod=indent
set foldlevel=99
set foldnestmax=2

" Mapping for changing windows"
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Mapping to copy from visual to system clipboard"
map <c-c> "+y
map <c-b> "+p

set nocompatible
set laststatus=2 "Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set number

" Allow Vim to manage multiple buffers"
set hidden

" Use mouse with wim
set mouse=a
set ttymouse=xterm2

" Set colors scheme"
set t_Co=256
set background=dark
colorscheme solarized

" Map leader to ','"
let mapleader = ","

" Plugin  mapping"
nnoremap <leader>a :Ag!
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>j :RopeGotoDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>n :NERDTree<CR>
nnoremap <leader>p :CtrlP<CR>
nnoremap <leader>r :RopeRename<CR>

" CtrlP parameters
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ 'link': '',
  \ }

" Flake 8 parameters
autocmd FileType python map <leader>8 :call Flake8()<CR>
let g:syntastic_enable_highlighting=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='☡'
let g:syntastic_sign_bg_default=1

let g:flake8_max_line_length=79
let g:flake8_max_complexity=12

" Markdown parameters
let g:vim_markdown_folding_disabled=1

highlight SpellBad term=reverse ctermbg=1

" Long history"
set history=1000

" Enable extendend % matching"
runtime macros/matchit.vim

" Better completion"
set wildmenu
set wildmode=list:longest

" Casesmart searching"
set ignorecase
set smartcase

" Terminal title and scrolloff"
set title
set scrolloff=3

" Set swap files directory to custom centralized"
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Set the ruler"
set ruler

" Intuitive backspacing in insert mode"
set backspace=indent,eol,start

" File-type highlighting and configuration."
" Run filetype without args to see what you may have"
" to turn on yourself, or just set them all to be sure."
syntax on
syntax enable
filetype on
filetype plugin on
filetype indent on

" Highlight search terms..."
"set hlsearch
set incsearch " ...dynamically as they are typed."

" Catch trailing whitespace"
set list listchars=tab:»·,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" Indenting style"
autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
autocmd Filetype mkd set sts=4 shiftwidth=4 expandtab
autocmd Filetype sql set sts=4 shiftwidth=4 expandtab
autocmd Filetype python,go set sts=4 shiftwidth=4 expandtab
autocmd Filetype nginx set sts=4 shiftwidth=4 expandtab
autocmd Filetype jade set sts=2 shiftwidth=2 expandtab
autocmd Filetype coffee set sts=2 shiftwidth=2 expandtab
autocmd Filetype json set sts=2 shiftwidth=2 expandtab
autocmd Filetype eco set sts=2 shiftwidth=2 expandtab
autocmd Filetype javascript set sts=2 shiftwidth=2 expandtab
autocmd Filetype ruby set sts=2 shiftwidth=2 expandtab
autocmd Filetype xml set sts=2 shiftwidth=2 expandtab
autocmd Filetype html set sts=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango set sts=2 shiftwidth=2 expandtab
autocmd Filetype yaml set sts=2 shiftwidth=2 expandtab
autocmd Filetype yml set sts=2 shiftwidth=2 expandtab
autocmd Filetype less set sts=2 shiftwidth=2 expandtab
autocmd Filetype java set sts=2 shiftwidth=2 expandtab nolist
autocmd Filetype stylus set sts=2 shiftwidth=2 expandtab
autocmd Filetype xslt,diff set expandtab

autocmd BufRead *.py set cindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py nnoremap <c-p> :normal oimport ipdb; ipdb.set_trace()<esc>
autocmd BufNewFile,BufRead requirements*.txt set ft=config
autocmd BufNewFile,BufRead *.json,*.conf set ft=json
autocmd BufNewFile,BufRead *.yaml,*.yml set ft=yaml
autocmd BufRead,BufNewFile *.cnf set ft=gitconfig
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/* if &ft == 'json' | set ft=nginx | endif
