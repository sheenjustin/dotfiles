
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
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

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
set wildmode=list:longest,full

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

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
set numberwidth=3



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"Colors
highlight LineNr term=None cterm=NONE ctermfg=White ctermbg=DarkGrey gui=NONE guifg=DarkGrey guibg=NONE



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile

set undodir=~/.vim/undodir//
set undofile

set backupdir=~/.vim/backupdir//
set directory=~/.vim/backupdir//



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"User hard tabs always
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
"Enable indentLine
let g:indentLine_enabled = 1
set conceallevel=2
let g:indentLine_conceallevel=1
let g:indentLine_setColors = 0
let g:indentLine_bgcolor_term = 202
let g:indentLine_color_term = 239
let g:indentLine_char = ' '
let g:indentLine_leadingSpaceChar = ' '
let g:indentLine_leadingSpaceEnabled = 1

set listchars=eol:¬,tab:»\ ,trail:~,extends:>,precedes:<,space:·
set list

hi Whitespace	ctermfg=239
hi NonText		ctermfg=238

match NonText /\t/
match Whitespace /\s/

hi WhiteSpaceMol ctermfg=235
hi WhiteSpaceBol ctermfg=239

match WhiteSpaceMol /\s/
2match WhiteSpaceBol /^\s\+/


"enable airline arrows with powerline fonts
let g:airline_powerline_fonts=1

"Status on top. For some reason this doesn't work
"let g:airline_statusline_ontop=1

"Pathogen Call
call pathogen#infect()
