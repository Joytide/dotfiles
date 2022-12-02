set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" colorstuff
colorscheme murphy              " darkblue, delek, desert, evening, industry (other cool colorschemes)
syntax enable                   " activates syntax highlighting

" spaces and tabs
set tabstop=4                   " number of visual spaces per TAB
set softtabstop=4               " inserts 4 tabs for TAB
set expandtab                   " tabs are spaces
set shiftwidth=4                " indent 4 spaces

" Folderstuff
set backupdir=~/.vim/backups    " set backup folder
set undodir=~/.vim/undo         " set undo folder
set directory=~/.vim/swaps      " set swap folder

" UI config
set number                      " show line numbers
set cursorline                  " highlight current line
set colorcolumn=80              " show ruler after 80 chars
filetype plugin indent on       " load filetype-specific indent and plugin files
map <F4> :NERDTreeToggle<CR>    " maps F4 as NerdTree toggle
let NERDTreeShowHidden=1        " show hidden files in NerdTree
set pastetoggle=<F6>            " use F6 as toggle for pastemode, to safely paste code without indention
set wildmenu                    " visual autocomplete for command menu
set showmatch                   " highlight matching parenthesis
set encoding=utf-8              " utf-8
set ruler                       " show position of cursor in right-lower corner
set showcmd                     " show uncomplete command (like d, c etc.)
map <Tab> :tabn<CR>             " use tab to switch between tabs (forwards)
map <S-Tab> :tabp<CR>           " use shift-tab to switch between tabs (backwards)

" Searching
set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches
map <F5> :nohlsearch<CR>        " use F5 for deleting search highlights
set ignorecase                  " no case sensitive searching
set smartcase                   " case sensitive searching only with upper case characters

" Mouse things
set mouse=n                     " enables mouse usage for normal mode


" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it. Can't
" understand why isTabTree doesn't work tho
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') | quit | endif

" Always show tabs
set showtabline=2

" Remove central line
set colorcolumn=0

" Always have terminal
:nnoremap <leader>t :wincmd b \| bel terminal<CR>

" tmux command keybind for window mode
:nnoremap <C-b> <C-w>

" Functions

"" restores cursor position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
