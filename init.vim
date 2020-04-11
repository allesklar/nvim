" -----NEOVIM Configuration-----"

" highlighting
syntax enable           " syntax highlighting
colorscheme jellybeans  " the best by far. Subjectively
set hlsearch            " highlight search terms upon 'enter'
set incsearch           " highlight search terms live

set number relativenumber   " use hybrid numbers. Relative for all lines and absolute for current
set cursorline	            " highlight the cursorline.

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
" don't show current status in bottommost line
set noshowmode
""" using lightline plugin
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowb

" remove all trailing spaces upon saving file
autocmd BufWritePre * %s/\s\+$//e

set encoding=utf-8

""""" MAPPINGS:
""" INSERT MODE:
" on the mac i use karabiner-element to map Caps lock to Esc
" but on servers i use kk
" remapping 'kk' to the Escape key
inoremap kk <Esc>
" automatically append closing characters
inoremap " ""<left>
" inoremap ' ''<left> " single quotes are often used in regular English speech
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR><CR>}<Up><Tab>
inoremap {;<CR> {<CR><CR>};<Up><Tab>
inoremap ` ``<left>
""" NORMAL MODE:
" The map leader is the space bar
let mapleader=" "
" just press one key to go to command mode
nnoremap ; :
" use z instead of 0 to go to begining of line
nnoremap z 0
" see all buffers
" nnoremap <leader>bfs :buffers<cr>
" launch fuzzy finder - ff -> find file
nnoremap <leader>ff	:FZF<cr>
" load NERDTree
nnoremap <leader>nd	:NERDTree<cr>
" save
nnoremap <leader>s	:w<cr>
" select all and copy to clipboard
nnoremap <leader>ya :%y+<cr>
" open a new vertical split and switch over to it.
nnoremap <leader>wl <C-w>v<C-w>l
" open a new horizontal split and switch over to it.
nnoremap <leader>wj <C-w>s<C-w>j
" move around windows directionally with ctrl key
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Close buffer without closing the window
nnoremap <leader>r :bp\|bd<space>#<cr>
" vimgrep throughout the whole project
nnoremap <leader>vg :vimgrep //gj **/* \| :copen<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
" Ajust window size between 3 and 30 rows when viewing quicklist (via :copen)
au FileType qf call AdjustWindowHeight(3, 30)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

""" VISUAL MODE:
" copy selected text to clipboard
xnoremap y :"*y


" ================ LANGUAGES ==============
" ===== RUST
" for Rust files, indent is 4 spaces instead of 2
autocmd Filetype rs setlocal ts=2 sw=2 expandtab
" rust.vim plugin turns automatic rustfmt on save.
let g:autofmt_autosave = 1


" PLUGINS:
" the pathogen plugin helps installing all other plugins
execute pathogen#infect()
" fzf fuzzyfinder installed via homebrew
set rtp+=/usr/local/opt/fzf

" PLUGIN SETTINGS:
"""""" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.wiki'}]
" save all vimwiki buffers upon exit
let g:vimwiki_autowriteall = 1

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
