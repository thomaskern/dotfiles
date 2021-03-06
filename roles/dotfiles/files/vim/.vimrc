set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'altercation/vim-colors-solarized'

Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'scrooloose/syntastic'
Plugin 'myusuf3/numbers.vim'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-rooter'
Plugin 'Valloric/YouCompleteMe'

Plugin 'chase/vim-ansible-yaml'



call vundle#end()

" Set smart indenting
filetype plugin indent on

""""""""""""""""""""""""""""""
"" My actual config
""""""""""""""""""""""""""""""

" Change leader key to something less stupid
let mapleader=","

""""""""""""""""""""""""""""""
"" How it looks + feels
""""""""""""""""""""""""""""""

syntax on

" In xterm, set the tab's title to the current file
set title

" Enable mouse support
set mouse=a

" Remove intro message
set shortmess=atI

" Make backspace behave
set backspace=indent,eol,start

""""""""""""""""""""""""""""""
"" General Mappings
""""""""""""""""""""""""""""""
" Map ; to :
nnoremap ; :

" Remap jj to <Esc>
:imap jj <Esc>

" Disable arrow keys 
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

""""""""""""""""""""""""""""""
"" Buffer Mappings
""""""""""""""""""""""""""""""

" Left/Right changes buffer
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>
nnoremap <S-h> <C-w>h<C-w>h<C-w>h<C-w>h
nnoremap <S-l> <C-w>l<C-w>l<C-w>l<C-w>l

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""""""""""
"" F-Keys Mappings
""""""""""""""""""""""""""""""

" Reindent!
map <F7> mzgg=G`zmz

""""""""""""""""""""""""""""""
"" Command bar config
""""""""""""""""""""""""""""""

" Always show a ruler
set ruler

" Set it's height to 2
set cmdheight=2
" Always show
set laststatus=2

" Show the current line+column, then current working dir, then current file.
" Then show if it's read only, then if it's a help pane, then if it's a
" preview window. Next, show any syntax errors with Syntastic
set statusline=[%l,%v][CWD:\ %{CWD()}][FILE:\ %f]\ %r%h%w\ %#warningmsg#%{SyntasticStatuslineFlag()}%*

" Show command info, e.g. {lines}x{columns} when in visual
set showcmd

" Show what mode we're in too
set showmode

"""""""""""""""""""""""""
"" Searching
"""""""""""""""""""""""""

" Case insensitive searching, unless it contains a capital
set ignorecase smartcase

" Enable find-as-you-type searching
set incsearch

" Highlight all matches
set hlsearch

" Disable search highlight on <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Make search wrap around
set wrapscan

"""""""""""""""""""""""""
"" Word completion
"""""""""""""""""""""""""

" Enable file completing a la ZSH when using tab to complete file names
" aka: Complete to the longest common substring then cycle through
set wildmode=longest,full

" Ignore some file types when completing
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.zip,*.rar                      " Ignore archive files

"""""""""""""""""""""""""
"" Set various options
"""""""""""""""""""""""""

" hidden - http://usevim.com/2012/10/19/vim101-set-hidden/
set hidden

" Tabs = 4 spaces
set tabstop=4 shiftwidth=4 expandtab softtabstop=4
"set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Keep 15 lines from the top/bottom at all times
set scrolloff=15

" Keep 15 chars to the right/left visible + scroll 1 char at a time
set sidescrolloff=15
set sidescroll=1

" Show trailing whitespace
set list listchars=tab:»·,trail:·

" Some general formatting options
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words

" New splits go below and to the right
set splitbelow
set splitright

" Share the system clipboard
set clipboard=unnamedplus

" Highlight column 80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Don't add an EOL if the file doesn't have one already
set noeol

" Assume /g flag on :s replaces
set gdefault

" No code folding
set nofoldenable

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or

" Tell netrw to keep its history file in ~/.vim/tmp
let g:netrw_home = '/tmp'

" Keep temporary files out of working directories. Trailing double-slash tells
" vim to base the filename on the full path of the original to avoid conflicts.
:set directory=$HOME/.vimlocal/swapfiles//

"""""""""""""""""""""""""
"" Remap various options
"""""""""""""""""""""""""

" In visual block mode, make tab/shift-tab indent/outdent
vmap <Tab> >
vmap <S-Tab> <

" Jump to first char with 0, and beginning of line with ^
nnoremap 0 ^
nnoremap ^ 0

" gj/gk treat wrapped lines as separate
" (i.e. you can move up/down in one wrapped line)
" I like that behavior better, so I inverted the keys.
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Make Y behave like D and C, go from cursor to end
nnoremap Y y$

" Nicer split resizing with ctrl+left/right
map <silent><C-Left> :vertical resize -5<cr>
map <silent><C-Right> :vertical resize +5<cr>

" Don't deselect when using tab/shift-tab in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Force saving files that need root
cmap w!! %!sudo tee > /dev/null %

" Jump to tag with ,F
nnoremap <silent> <leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tag ". word)<cr>

" This is a cheat, but it's useful. Enable <cr> in normal mode
nnoremap <silent> <CR> :put=''<CR>

" Make U do the opposite of u (aka redo)
nnoremap U <C-r>

"""""""""""""""""""""""""
"" Helpful functions
"""""""""""""""""""""""""

" Get the current working dir, nicely formatted
function! CWD()
    let curdir = substitute(getcwd(), '/Users/michael', "~", "g")
    let curdir = substitute(curdir, '/home/michael', "~", "g")
    return curdir
endfunction

"""""""""""""""""""""""""
"" Plugins
"""""""""""""""""""""""""

""""" ctrlp.vim
nmap <C-o> :CtrlPBuffer<CR>
"let g:ctrlp_prompt_mappings = {
"  \ 'AcceptSelection("e")': [],
"  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
"  \ }

let g:ctrlp_custom_ignore = {
  \ 'dir':  'vendor\|node_modules\|\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

let g:ctrlp_show_hidden = 1

" The Silver Searcher
" taken from: http://robots.thoughtbot.com/faster-grepping-in-vim/
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --hidden --ignore .git'

  " set up Ack.vim to actually use ag
  let g:ackprg = 'ag --nogroup --nocolor --column'

  " bind K to grep word under cursor
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

let $PYTHONPATH="/usr/lib/python3.5/site-packages"
let g:Powerline_symbols = 'fancy'

