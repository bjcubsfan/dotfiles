" .vimrc
"
"BJP added first few lines for python features
if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

set backspace=2  " backspace can join lines
set joinspaces   " insert two spaces after a period after line join
set hh=0         " this combined with ea should autobalance help
set magic        " do the right thing with regex's
set backupdir=/home/bpotter/.backup,/data/tmp,/tmp
set directory=/home/bpotter/.backup,/data/tmp,/tmp
set ruler        " display row,col ruler
set showcmd      " helps avoid command-mode typos
set showmatch    " show matching delimiter for parentheses, braces, etc
set showmode     " show which mode I am in
"set noet         " don't expand tab
set nojs         " don't join spaces
set ea           " this should autobalance windows
set expandtab    " insert space characters whenever the tab key is pressed
set tabstop=4    " Controls the number of space characters that will be inserted when t
set shiftwidth=4 " Changes the number of space characters inserted for indentation
set hlsearch     " Highlight Search Results
set background=dark "If you use a dark background set this to make the fonts a better c
set nowrap
syntax enable
set paste
set ruler
set viminfo='10,\"100,:20,%,n~/.viminfo
set number     " Good for writing code.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|ex
set smartindent  " this is pretty nifty most of the time
" makes '#' not move back to start of lin
inoremap # X#
set softtabstop=4
" setlocal spell spelllang=en_us
" set spellfile=~/.vim/spellfile.{encoding}.add
" set nospell

" added by BJ
set t_Co=256
colorscheme solarized
"colorscheme ir_black
"colorscheme ps_color
"set smarttab
"set autoindent
set incsearch
set wm=8

set textwidth=72
filetype plugin on
filetype plugin indent on
:set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"[ASCII=\%03.3b]\ [HEX=\%02.2B]\
:set laststatus=2

if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"Wrap with h and l
set whichwrap=h,l,~,[,]

"Put Blank Line: from comp.editors
"puts a blank line before or after cursor without leaving normal mode
nnoremap - :put"=<CR>
nnoremap + :put!"=<CR>

"noremap <Space> <PageDown>
noremap <Ins> 2<C-Y>
noremap <Del> 2<C-E>
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
nnoremap <C-I> :set linebreak wrap spell<CR>
nnoremap <C-T> :CommandT<CR>
nnoremap <C-Y> :set linebreak wrap<CR>
nnoremap <C-D> :set nolinebreak nowrap nospell paste smartindent<CR>
"Latex Acroynmn and Latex Mode
nnoremap <C-A> T i\ac{<Esc>t a}<Esc>
nnoremap <C-L> :set tw=72 nopaste spell nosmartindent<CR>

"C options
set comments=sl:/**,mb:**,elx:*/
iab ccc /***/<Left><Left>
iab whilee while () {}<Left><Left><Left><Left>
iab iff if () {}<Left><Left><Left><Left>
iab forr for () {}<Left><Left><Left><Left>

"ctags plugin options
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_WinWidth=50
map <F4> :TlistToggle<cr>

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

" Map the F2 key to the clean white space command
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"Options to only match case if a capital is in search, other
"wise the search will be case insensitive.
set ic
set scs


"commentify options
let g:EnhCommentifyMultiPartBlocks = 'yes'
map <C-c> :call EnhancedCommentify('','guess')<CR>
vmap cc :call EnhancedCommentify('','comment')<CR>
vmap cd :call EnhancedCommentify('','decomment')<CR>

set guifont=Ubuntu\ Mono\ 14  
" If you want, you can have whitespace cleaned up automatically on write
" Uncomment to enable white space removal on write
"autocmd FileWritePre *   :call TrimWhiteSpace()
"autocmd FileAppendPre *  :call TrimWhiteSpace()
"autocmd FilterWritePre * :call TrimWhiteSpace()
"autocmd BufWritePre *    :call TrimWhiteSpace()

" Highlight indentation level
autocmd VimEnter * :IndentGuidesEnable
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  guibg=#073642 ctermbg=8
hi IndentGuidesEven guibg=#002b36 ctermbg=0

" Insert date stamps
nmap <F3> a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" Insert pdb line
nmap <F5> Oimport pdb; pdb.set_trace()<Esc>
imap <F5> import pdb; pdb.set_trace()
