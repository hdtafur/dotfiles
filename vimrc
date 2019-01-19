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

" Vundle Settings and Plugins
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-system-copy'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'matze/vim-move'
Plugin 'morhetz/gruvbox'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'ngmy/vim-rubocop'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'osyo-manga/vim-over'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thoughtbot/pick.vim'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ruby/vim-ruby'
Plugin 'henrik/vim-indexed-search'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmili/alchemist.vim'
Plugin 'danro/rename.vim'
Plugin 'sbdchd/neoformat'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
" Plugin 'chriskempson/base16-vim'
Plugin 'altercation/vim-colors-solarized'
" Plugin 'geoffharcourt/one-dark.vim'
Plugin 'prettier/vim-prettier'


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

syntax enable

" Gruvbox
" colorscheme gruvbox
" set background=dark
" let g:gruvbox_contrast_dark='soft'
" set background=light
" let g:gruvbox_contrast_light='hard'

" Base16 Color Scheme
" set background=dark
" colorscheme base16-ocean

" Solarized Color Scheme
set background=light
colorscheme solarized
let g:solarized_termcolors=256

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
