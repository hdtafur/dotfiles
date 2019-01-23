let mapleader=','

set number
set relativenumber

set shell=/bin/bash

" Tab Spacing
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set bri


" Proper Backspacing Setting
set nocompatible
set backspace=indent,eol,start

" Mouse Capability in Vim
set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-system-copy'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'matze/vim-move'
Plug 'morhetz/gruvbox'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ngmy/vim-rubocop'
Plug 'ntpeters/vim-better-whitespace'
Plug 'osyo-manga/vim-over'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'thoughtbot/pick.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'henrik/vim-indexed-search'
Plug 'godlygeek/tabular'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'danro/rename.vim'
Plug 'sbdchd/neoformat'
Plug 'kchmck/vim-coffee-script'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }


 call vundle#end()
 filetype plugin indent on


" General Settings
set nocompatible
set noswapfile
set noerrorbells
set visualbell
set hidden
syntax on
set timeoutlen=250 ttimeoutlen=0
set cursorline cursorcolumn


" Color Scheme Settings
highlight Comment cterm=italic
syntax on
color dracula
syntax enable


" Search Settings
set incsearch
set hlsearch
set ignorecase
set smartcase

nmap <Leader>h :nohlsearch<CR>

" Cursor Movement in Insert Mode
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>


" Split Settings
set splitbelow
set splitright


" Movement between Splits
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l


" Buffer Shortcuts
nnoremap <Leader>bb :b<SPACE>
nnoremap <Leader>bd :bd<SPACE>
nnoremap <Leader>bda :%bd
nnoremap <Leader>bdl :bd#
nnoremap <Leader>l :ls<SPACE>
nnoremap gb :bp<CR>
nnoremap gn :bn<CR>
nnoremap gd :bd<CR>
nnoremap gp :b#<CR>
nnoremap <Leader>cl :ccl<CR>


" Vim-Airline Settings
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline_section_b='%f'
let g:airline_section_c=''
let g:airline_section_x='%v'
let g:airline_section_y='%l'
let g:airline_section_z='%p%%'
" let g:airline_left_alt_sep=''
" let g:airline_right_alt_sep=''
let g:airline_theme='base16'


" NERDTree Settings
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=30
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
nmap <Leader>nn :NERDTree<CR>
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>


" File Capabilities
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>


" Mapping Alt Key Correctly
let c=']'
while c<='z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c=nr2char(1+char2nr(c))
endw


" Bind K to grep word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
vnoremap K y:Ack! "\b<C-R>"\b"<CR>:cw<CR>

" Bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ack<SPACE>


" Ctags
nnoremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" Handlebars Abbreviations Activation
let g:mustache_abbreviations=1


" Find and Replace
function! VisualFindAndReplace()
  :set nohls!
  :OverCommandLine%s/
  :set nohls!
endfunction

function! VisualFindAndReplaceWithSelection() range
  :set nohls!
  :'<,'>OverCommandLine s/
  :set nohls!
endfunction

nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>


" Emmet Settings
let g:user_emmet_leader_key='<Leader>e'


" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_filetype_map={ 'html.handlebars': 'handlebars' }
let g:syntastic_mode_map={ 'passive_filetypes': ['sass', 'scss'] }
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_ignore_errors=["proprietary attribute", "is not recognized!", "discarding unexpected", "trimming empty <", "missing </a>", "attribute name"]


" Return to Marked Spot Keymapping
nnoremap <Leader>m `


" Set Old RegEx Engine
set re=1


" IndentLine Settings
" let g:indentLine_color_term=8
" let g:indentLine_char='·'


" Ruby Path for rbenv Usage
let g:ruby_path=system('echo $HOME/.rbenv/shims')


" Redraw Mapping
nnoremap <Leader>r :redraw!<CR>


" Multiple Cursor Exit from Different Modes
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_exit_from_visual_mode=0


" Vim Fugitive Configuration
set diffopt+=vertical



" Pick
nnoremap <C-P> :call PickFile()<CR>
nnoremap <C-S> :call PickFileSplit()<CR>
nnoremap <C-V> :call PickFileVerticalSplit()<CR>
nnoremap <C-B> :call PickBuffer()<CR>
let g:pick_height = 10


" JSX Syntax
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Ack search
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Ack be pucking all over terminal
set shellpipe=>

" Make Neoformat run on save to pretty format JS
" autocmd BufWritePre *.js Neoformat
" autocmd BufWritePre *.jsx Neoformat

call plug#end()