"source $VIMRUNTIME/defaults.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "

" Fast saving
nmap <leader>w :w!<cr>

nmap <leader>q :q<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu
if !has('nvim')
	set wildmode=list:longest,list:full
endif
"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set bs=2

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add numbers on the left
set nu
set numberwidth=4



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
"set background=dark
"colo ron
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Colors
"highlight LineNr term=None cterm=NONE ctermfg=White ctermbg=DarkGrey gui=NONE guifg=DarkGrey guibg=NONE
hi LineNr cterm=NONE ctermfg=250


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

hi clear LineNr
hi LineNr	ctermfg=250


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

set undodir=~/.vim/undodir/
set undofile

set backupdir=~/.vim/backupdir/
set directory=~/.vim/backupdir/



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use hard tabs always
set noexpandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=0

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	endif
	return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showbreak=↪\ 
"set listchars=eol:↲,tab:»\ ,trail:~,extends:⟩,precedes:⟨,space:⋅
"set list

hi Whitespace	ctermfg=239
hi NonText		ctermfg=238

match NonText /\t/
match Whitespace /\s/

hi WhiteSpaceMol ctermfg=236
hi WhiteSpaceBol ctermfg=239

match WhiteSpaceMol /\s/
match WhiteSpaceBol /^\s\+/

set ts=4 sw=4 noet
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_guide_size = 1

let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=DarkGrey	ctermbg=235 ctermfg=239
hi IndentGuidesEven guibg=DarkGrey	ctermbg=236 ctermfg=240

" If this highlight group isn't defined it throws an error
hi Normal			ctermfg=250


"enable airline arrows with powerline fonts
let g:airline_powerline_fonts = 1

let g:airline_theme='base16_monokai'

" Vim Git-Gutter settings
set signcolumn=yes
highlight! link SignColumn LineNr
highlight SignColumn guibg=DarkGrey ctermbg=234

highlight GitGutterAdd    guifg=#A6E22E ctermfg=2
highlight GitGutterChange guifg=#66D9EF ctermfg=3
highlight GitGutterDelete guifg=#F92672 ctermfg=1


"Status on top. For some reason this doesn't work
"let g:airline_statusline_ontop=1
"call pathogen#infect()
"call pathogen#helptags()

let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheenjustin/vim-monokai-tasty'

Plug 'icedman/vim-textmate'

Plug 'sheenjustin/cf-utils.vim'
Plug 'dag/vim-fish'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

if has('nvim')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

call plug#end()

if has('nvim')
	lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
endif

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
colorscheme vim-monokai-tasty

