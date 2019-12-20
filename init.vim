" The line below should come first!
" OPTIMIZE	This might not be needed with neovim
set nocompatible	"	use vim superior vim settings rather than plain vi ones

syntax enable           " syntax highlighting
colorscheme jellybeans  " the best by far. Subjectively
set hlsearch            " highlight search terms upon 'enter'
set incsearch           " highlight search terms live

" set number			        "	show line numbers on the left side
set relativenumber      " use relative numbers for easy navigation
set ruler				        "	show line and character number in bottom right of screen
set cursorline	        " highlight the cursorline.

" default indent is 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab           " convert tabs to spaces
" use :retab  in document to convert existing tabs to spaces
set autoindent          " Upon creating a new line with CR, align with previous line

" Word wrapping without linebreaks
set wrap
set linebreak
set nolist              " list disables linebreak

" ================ status line  ==============
set laststatus=2
set statusline=
set statusline+=\ %f

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" remove all trailing spaces upon saving file
autocmd BufWritePre * %s/\s\+$//e

set encoding=utf-8

"MAPPINGS:
" INSERT MODE:
" on the mac i use karabiner-element to map Caps lock to Esc
" but on servers i use kk
" remapping 'kk' to the Escape key
inoremap kk <Esc>
" NORMAL MODE:
" The map leader is the space bar
let mapleader=" "
" just press one key to go to command mode
nnoremap ; :
" see all buffers
" nnoremap <leader>bfs :buffers<cr>
" launch fuzzy finder - ff -> find file
nnoremap <leader>ff	:FZF<cr>
" load NERDTree
nnoremap <leader>nd	:NERDTree<cr>
" save
nnoremap <leader>s	:w<cr>
" open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l
" move around windows directionally with ctrl key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" ================ LANGUAGES ==============
" ===== RUST
" for Rust files, indent is 4 spaces instead of 2
autocmd Filetype rs setlocal ts=2 sw=2 expandtab
" rust.vim plugin turns automatic rustfmt on save.
let g:autofmt_autosave = 1


" PLUGINS:
" the pathogen plugin helps installing all other plugins
execute pathogen#infect()
" autostart NERDTree at current directory when vim starts
autocmd vimenter * NERDTree
" fzf fuzzyfinder installed via homebrew
set rtp+=/usr/local/opt/fzf

" PLUGIN SETTINGS:

"""""" NERDTree
let NERDTreeShowHidden=1
" open NERTTree to current file
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1
" nicely format NERDTree with expand/collapse arrows
let NERDTreeDirArrows = 1

""""" NERDcommenter """"" toggle comments
""" default mappings found at: https://github.com/scrooloose/nerdcommenter
" main one i use is <leader>ci <<< comments inverse
""" required by nerdcommenter instructions
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
