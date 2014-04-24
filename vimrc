call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("terminfo")
  let &t_Co=16
  let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
  let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
else
  let &t_Co=16
  let &t_Sf="\<Esc>[3%dm"
  let &t_Sb="\<Esc>[4%dm"
endif

" Global
" ======
set nocompatible	" Forget compatibility with Vi. Who cares.
set autowrite		" Write the old file out when switching between files.
set hidden		  	" Switch between buffers without saving
set splitbelow		" Split windows below the current window.
set foldenable		" Enable code folding
set mousehide		" Hide mouse when typing
set autoread		" Set to auto read when a file is changed from the outside
set vb t_vb=		" Disable beeping

set clipboard=unnamed	" Share clipboard with OS

set encoding=utf-8
set fileencoding=utf-8

" Source the .vimrc file after saving it
"if has("autocmd")
"	autocmd bufwritepost .vimrc source $MYVIMRC
"endif

" Automatically change current directory to that of the file in the buffer
" Jag kommenterar ut denna för tillfället för att testa hur jag gillar det
"autocmd BufEnter * cd %:p:h

" Enable filetypes
" ----------------
filetype on
filetype plugin on
filetype indent on
syntax on

" Tab stuff
" ---------
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " Space?
"set noexpandtab " Tab?

" Indent stuff
" ------------
set smartindent
set autoindent

" Better line wrapping
" --------------------
set wrap
set textwidth=79
set formatoptions=qrn1

" Layout?
" -------
set showcmd					" Show command in button right partion of the screen
set number					" Show lines numbers
" set relativenumber		" Prefer relative line numbering?
set ruler					" Display current cursor position in lower right corner.
set laststatus=2			" Always show the status line
" set linespace=3			" Prefer a slightly higher line height
"set list					" Show linebrake and tab symbols
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Search
" ------
set incsearch	" Set incremental searching
set hlsearch	" Highlight searching

" Autocompletion
" --------------
" For autocompletion
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set wildmode=list:longest
set completeopt=longest,menuone

" Put swap files in /tmp file
" ---------------------------
set backupdir=~/.tmp
set directory=~/.tmp



" Keyboard & Shortcuts
" ====================
let mapleader = ','
let maplocalleader = '\\'
"set timeoutlen=500 " Ever notice a slight lag after typing the leader key + command? This lowers the timeout.

" Saves time
nnoremap <space> :
inoremap jj <esc>

" Shortcut to rapidly toggle `set list`
nnoremap <leader>l :set list!<CR>
" Shortcut for editing .vimrc file in a new tab
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
" Hard-wrap paragraphs of text
nnoremap <leader>q gqip
" Shortcut to fold tags with leader (usually \) + ft
nnoremap <leader>ft Vatzf
" Map code completion to , + tab
inoremap <leader><tab> <C-x><C-u>
" Delete all buffers (via Derek Wyatt)
nnoremap <silent> <leader>da :exec "1," . bufnr('$') . "bd"<cr>
" Switch to the directory of the current file with <leader>cd
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Make word uppercase
inoremap <leader>u <esc>viwUea

" Javascript console.log debugging
nnoremap <leader>d Oconsole.log("DEBUGGING  <esc>:execute "normal! i" . ( line(".") )<cr>a");<esc>hh
vnoremap <leader>d yOconsole.log(<esc>pa);<esc>

" Load the current buffer in Firefox, Chrome or Safari
abbrev ff :! open -a firefox.app %:p<cr>
abbrev chr :! open -a Google\ Chrome %:p<cr>
abbrev safari :! open -a safari.app %:p<cr>

" Speed up buffer switching
noremap <C-k> <C-W>k
noremap <C-j> <C-W>j
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Simple calculator (1+1<C-a> => 1+1=2)
ino <C-A> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Use the arrows to switch buffer
noremap <right> :bn<cr>
noremap <left> :bp<cr>

" Scroll page up/down with gj/gk
nnoremap gj <C-f>
nnoremap gk <C-b>

" Automatically append closing characters
" http://vim.wikia.com/wiki/Automatically_append_closing_characters
inoremap {<CR>  {<CR>}<Esc>O
inoremap {<Tab> {  }<Esc>hi

" Move text with ctrl + up/down
" -----------------------------
" Bubble signle lines
nnoremap <C-Up> ddkP
nnoremap <C-Down> ddp

" Buble multiple lines
vnoremap <C-Up> xkP`[V`]
vnoremap <C-Down> xp`[V`]

" Exercise from Learn Vimscript the Hard Way.
nnoremap <leader>w :match Error /\v\s$/<cr>
nnoremap <leader>W :match Error /dfafahlasfdjwjofds/<cr>

" Find word in other files
"nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>



" Language specific
" =================
" Javascript file settings {{{
augroup filetype_javascript
  autocmd!
  " TODO Should I use <buffer>?
  autocmd Filetype javascript nnoremap <leader>c I//<esc>
  autocmd Filetype javascript vnoremap <leader>c <esc>`<I/*<esc>`>A*/<esc>
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
augroup END
" }}}
" Markdown file settings {{{
augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak nolist

  " Nearest headline
  autocmd FileType markdown onoremap ih :<c-u>execute "normal! jj?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap ah :<c-u>execute "normal! jj?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
" Ruby file settings {{{
augroup filetype_ruby
  autocmd!
  autocmd BufNewFile,BufRead Rakefile,Capfile,Gemfile,Termfile,Vagrantfile,config.ru,*.rabl set filetype=ruby
  autocmd BufRead,BufNewFile *.erb set filetype=erb.eruby.html " Make html.erb use html5.vim
augroup END
" }}}
" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

autocmd FileType html,css,scss,ruby,pml,yaml,coffee,vim,erb setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.rss setfiletype xml

" Run current rubyfile
nnoremap <leader>r :w<cr>:!ruby %<cr>
abbrev irb :w<cr>:!irb -r ./%<cr>


" MacVim
" ======
if has("gui_macvim")
	" Set the color scheme. Change this to your preference.
	" Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
	"colorscheme desert
  colorscheme codeschool

	" Set font type and size
	set guifont=Monaco:h12

	" Hide MacVim toolbar by default
	set go-=T

  " Make fullscreen take up entire screen
	set fuoptions=maxhorz,maxvert

  " Hide right-hand scrollbar
  set go-=r
  set go-=R

  " Hide left-hand scrollbar
  set go-=l 
  set go-=L 



" CUI
" ===
else
  syntax enable
  set background=dark
  " colorscheme solarized
	colorscheme desert256
  " colorscheme codeschool

	" Set font type and size
	set guifont=Monaco:h10
endif



" Plugins
" =======
" NERDTree
" --------
" Shortcut for NERDTreeToggle
"inoremap ,nt :NERDTreeToggle
nnoremap <F4> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" Show hidden files in NerdTree
" let NERDTreeShowHidden=1

" Autopen NERDTree and focus cursor in new document
" if has("gui_macvim")
"   autocmd VimEnter * NERDTree
"   autocmd VimEnter * wincmd p
" endif

" Emmet
" -----
let g:user_emmet_expandabbr_key = '<leader>t'

" Gundo
" -----
nnoremap <F5> :NERDTreeClose<CR>:GundoToggle<CR>
let g:gundo_preview_bottom = 1

" Tagbar
" ------
nnoremap <F6> :TagbarToggle<CR>

" MiniBufExplorer
" ---------------
let g:miniBufExplSplitBelow=1
let g:miniBufExplorerMoreThanOne=4
let g:miniBufExplUseSingleClick=1

" SuperTab like snippets behavior. 
let g:SuperTabDefaultCompletionType = "context" 


" Abbreviations
" =============
" Helpful abbreviations
iab lorem Lorem ipsum dolor sit amet... Jag ska fylla i mer sen
iab llorem Lorem ipsum dolor sit amet... Lorem ipsum dolor sit amet... Jag ska fylla i mer sen

" Spelling corrects
source ~/.vim/abbreviations
" TODO:
" :!echo 'iab rod ord' >> .vim/abbreviations
" :source .vim/abbreviations
"
" function AddAbbreviation(wrong, right)
"   ...
" endfunction


" Test
" ====
" Opens a vertical split and switches over (\v)
" nnoremap <leader>v <C-W>v<C-w>l

" Set up an HTML5 template for all new .html files
" autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

" Example for adding abbreviations - triggered by the spacebar.
"iabbrev mysite ftp://username@server/folder/

" Create dictionary for custom expansions
"set dictionary+=/Users/christian/.vim/dict/PHP.dict
