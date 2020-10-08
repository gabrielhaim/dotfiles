" Vim Configuration file"
" vimrc for Python and Golang IDE"
" Gabriel Haim 2020-02-20"

" VimPlug

call plug#begin('~/.vim/plugged')

Plug 'AndrewRadev/splitjoin.vim'
Plug 'dense-analysis/ale'
Plug 'elzr/vim-json', {'for': 'json'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'morhetz/gruvbox'
Plug 'rking/ag.vim'
Plug 'solarnz/thrift.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Load coc-vim settings
source ~/.vim/coc-vim.vim

" Ligthline setup
let g:lightline = {'colorscheme': 'jellybeans'}

" Automagically run goimports on save
let g:go_fmt_command = "goimports"

" Vim Go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Run lint and vet on save
let g:go_metalinter_command = "golangci-lint"
let g:ale_linters = {'go': 'gopls'}

" YCM disable for Go
let g:ycm_filetype_blacklist = {'go': 1}

" Folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=2

" Mapping for changing windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Mapping to copy from visual to system clipboard
map <c-c> "+y
map <c-b> "+p

set nocompatible
set laststatus=2 "Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set number

" Allow Vim to manage multiple buffers"
set hidden

" Use mouse with wim
" set mouse=a
" if !has('nvim')
" 	set ttymouse=xterm2
" endif

" Set colors scheme"
set t_Co=256
set background=dark
colorscheme gruvbox

" Map leader to ','"
let mapleader = ","

" Plugin mapping"
map <leader>n :NERDTree<CR>
map <leader>p :CtrlP<CR>
map <leader>g :GundoToggle<CR>
map <leader>j :YcmCompleter GoTo<CR>
map <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>a :Ag!

" CtrlP parameters
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ 'link': '',
  \ }

" JSON quote concealing
let g:vim_json_syntax_conceal = 0

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

" Ignore some files
set wildignore+=*.pyc

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
autocmd Filetype python set sts=4 shiftwidth=4 expandtab
autocmd Filetype nginx set sts=4 shiftwidth=4 expandtab
autocmd Filetype jade set sts=2 shiftwidth=2 expandtab
autocmd Filetype coffee set sts=2 shiftwidth=2 expandtab
autocmd Filetype json set sts=2 shiftwidth=2 expandtab
autocmd Filetype eco set sts=2 shiftwidth=2 expandtab
autocmd Filetype cucumber set sts=2 shiftwidth=2 expandtab
autocmd Filetype javascript set sts=2 shiftwidth=2 expandtab
autocmd Filetype lisp set sts=2 shiftwidth=2 expandtab
autocmd Filetype ruby set sts=2 shiftwidth=2 expandtab
autocmd Filetype xml set sts=2 shiftwidth=2 expandtab
autocmd Filetype html set sts=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango set sts=2 shiftwidth=2 expandtab
autocmd Filetype yaml set sts=2 shiftwidth=2 expandtab
autocmd Filetype yml set sts=2 shiftwidth=2 expandtab
autocmd Filetype less set sts=2 shiftwidth=2 expandtab
autocmd Filetype scss set sts=2 shiftwidth=2 expandtab
autocmd Filetype java set sts=2 shiftwidth=2 expandtab nolist
autocmd Filetype cpp set sts=4 shiftwidth=4 expandtab nolist
autocmd Filetype stylus set sts=2 shiftwidth=2 expandtab
autocmd Filetype xslt,diff set expandtab

autocmd BufReadPre viper,.viper set filetype=lisp
autocmd BufRead *.py set cindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py nnoremap <c-p> :normal oimport pdb; pdb.set_trace()<esc>
autocmd BufNewFile,BufRead requirements*.txt set filetype=config
autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.j2 set ft=python
autocmd BufNewFile,BufRead *.yaml,*.yml set ft=yaml
autocmd BufNewFile,BufRead *.hql set ft=sql
autocmd BufRead,BufNewFile *.cnf set ft=gitconfig
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/* if &ft == 'json' | set ft=nginx | endif
autocmd BufRead,BufNewFile *.go setlocal noet ts=4 sw=4 sts=4 nolist
autocmd BufRead,BufNewFile *.c setlocal noet ts=4 sw=4 sts=4
