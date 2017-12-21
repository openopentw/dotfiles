"""""""""""""""""""""""""""""""""""""""""""""""""""
" author: YJC (openopentw)
" description: my default vimrc setting on ubuntu
"""""""""""""""""""""""""""""""""""""""""""""""""""

" General Settings"{{{
" If no screen, use color term{{{
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif
"}}}
" Load Default Vim Settings{{{
if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif
"}}}
" Default Settings"{{{
set bs=2		" allow backspacing over everything in insert mode
set ai			" always set autoindenting on
" set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set foldmethod=indent
"}}}
" Special Settings"{{{
set modeline
set autochdir	" Automatically change to the current directory
set wildignorecase	" case-insensitive filename completion

" Crontabs must be edited in place
au BufRead /tmp/crontab* :set backupcopy=yes
"}}}
" File Encoding"{{{
set encoding=utf-8
set encoding=utf-8
set langmenu=zh_TW.UTF-8
language message zh_TW.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"}}}
" Backup Dirs"{{{
set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup		" keep a backup file
set showmatch " show another brace when input a brace
"}}}
"}}}

" View"{{{
" General Settings"{{{
set laststatus=2
set nu	" show line number
" set foldcolumn=1
set nowrap	" don't wrap
set cursorline	" show the same line
set wildmenu

set shiftwidth=4	"TODO: check if 8 is better than 4
set tabstop=4
set nohlsearch
set incsearch
set breakindent
"}}}
" ColorSchemes"{{{
" NOTE: default is white now
" set background=light
set background=dark

colorscheme lucius
" LuciusWhite
LuciusDark
" LuciusDarkHighContrast
" LuciusDarkLowContrast
" LuciusBlack
" LuciusBlackLowContrast
" LuciusWhiteLowContrast
" LuciusLight
" LuciusLightLowContrast
let g:lucius_use_bold = 1

" colorscheme github		" this one is good too!!
" colorscheme notepad-plus-plus		" the background is strange
" highlight CursorLine ctermbg=189
"}}}
" Length of Tab{{{
set shiftwidth=4	"TODO: check if 8 is better than 4
set tabstop=4

autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
"}}}
" TabLine"{{{
highlight TabLineSel term=bold,underline cterm=bold,underline ctermfg=7 ctermbg=0
highlight TabLine    term=bold cterm=bold
highlight clear TabLineFill
"}}}
" Syntax"{{{
syntax on

" autocmd BufNewFile,BufReadPost *.php set filetype=php
" autocmd BufNewFile,BufReadPost *.php set syntax=php
" autocmd BufNewFile,BufReadPost *.css set filetype=css
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"}}}
" showing Tabs(\t)"{{{
" set list " show all special words
" set listchars=tab:\|\ " show tabs as '|   '
" " set leader tabs to be gray
" highlight LeaderTab guifg=#666666
" match LeaderTab /^\t/
"}}}
" Highlight unwanted spaces in end of line"{{{
highlight ExtraWhitespace ctermbg=darkred guibg=darkcyan
autocmd BufEnter * if &ft != 'help' | match ExtraWhitespace /\s\+$/ | endif
autocmd BufEnter * if &ft == 'help' | match none /\s\+$/ | endif
"}}}
" Highlight Operators: '[{(><='"{{{
au BufRead,BufNewFile * syn match Braces display '[{}()\[\]]'
au BufRead,BufNewFile * syn match biOperator "<"
au BufRead,BufNewFile * syn match biOperator ">"
au BufRead,BufNewFile * syn match biOperator "<="
au BufRead,BufNewFile * syn match biOperator ">="
au BufRead,BufNewFile * syn match biOperator "=="
au BufRead,BufNewFile * syn match biOperator "\v\~\="
au BufRead,BufNewFile * syn match biOperator "="
"}}}
" show foldcolumn when there are folds in a file{{{
function HasFolds() "{{{
    "Attempt to move between folds, checking line numbers to see if it worked.
    "If it did, there are folds.

    function! HasFoldsInner()
        let origline=line('.')
        :norm zk
        if origline==line('.')
            :norm zj
            if origline==line('.')
                return 0
            else
                return 1
            endif
        else
            return 1
        endif
        return 0
    endfunction

    let l:winview=winsaveview() "save window and cursor position
    let foldsexist=HasFoldsInner()
    if foldsexist
        set foldcolumn=1
    else
        "Move to the end of the current fold and check again in case the
        "cursor was on the sole fold in the file when we checked
        if line('.')!=1
            :norm [z
            :norm k
        else
            :norm ]z
            :norm j
        endif
        let foldsexist=HasFoldsInner()
        if foldsexist
            set foldcolumn=1
        else
            set foldcolumn=0
        endif
    end
    call winrestview(l:winview) "restore window/cursor position
endfunction
"}}}
au CursorHold,BufWinEnter ?* call HasFolds()
"}}}
"}}}

" Hotkeys"{{{
" ESC"{{{
" imap jk <Esc>
" imap Jk <Esc>
" imap jK <Esc>
" imap JK <Esc>
				" by the way, it can be typed faster than jj.
"}}}
" FX keys"{{{
nmap <F2> <ESC>:tabe 
if has('win32') || has ('win64')	" if in windows
	let g:netrw_cygwin = 0
	let g:netrw_ssh_cmd  = '"C:\Program Files\PuTTY\plink.exe" -batch -T -ssh'
	let g:netrw_scp_cmd  = '"C:\Program Files\PuTTY\pscp.exe"  -batch -q -scp'
	let g:netrw_sftp_cmd = '"C:\Program Files\PuTTY\pscp.exe"  -batch -q -sftp'
endif
" nmap <F3> <ESC>:tabe scp://b04902053@linux9.csie.ntu.edu.tw:22/
" nmap <F3> <ESC>:OpenSession 
nmap <F4> <ESC>:set syntax=
" nmap <silent> <F5> :NERDTree<CR>	"NOTE: this is defined in /Plugin/Tool
nmap <F6> <ESC>:vs 
" map <F7> :set hls!<BAR>set hls?<CR>
	" to toggle highlight or not on searched words
if has('win32') || has ('win64')	" if in windows
	nmap <silent> <F8> <ESC>:!start explorer.exe %:p:h<CR>
	nmap <silent> <F9> <ESC>:!start powershell.exe<CR>
	nmap <silent> <F10> <ESC>:!start bash.exe<CR>
endif
"}}}
" about TABs"{{{
nmap g1 :tabn 1<CR>
nmap g2 :tabn 2<CR>
nmap g3 :tabn 3<CR>
nmap g4 :tabn 4<CR>
nmap g5 :tabn 5<CR>
nmap g6 :tabn 6<CR>
nmap g7 :tabn 7<CR>
nmap g8 :tabn 8<CR>
nmap g9 :tabn 9<CR>
nmap g0 :tabn 10<CR>

" nmap gc :tabnew<CR>
nmap gn :tabn<CR>
nmap gp :tabp<CR>
nmap g= :tabm +<CR>
nmap g- :tabm -<CR>
"}}}
" TODO: change the 'gJ' hotkey
" move between / move SPLITs"{{{
nmap gt <C-w><C-w>
" move between
nmap <silent> gk :wincmd k<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gh :wincmd h<CR>
nmap <silent> gl :wincmd l<CR>
" move
nmap <silent> gK :wincmd K<CR>
nmap <silent> gJ :wincmd J<CR>
nmap <silent> gH :wincmd H<CR>
nmap <silent> gL :wincmd L<CR>
"}}}
" add / remove COMMENTS in VISUAL mode"{{{
" NOTE: use 'tpope/vim-commentary' instead
" " (that is, before typing command to add comments, you should select the words)
" " ADD
" vmap // :s:^\(\s*\):\1// :<CR>
" vmap 33 :s:^\(\s*\):\1# :<CR>
" vmap "" :s:^\(\s*\):\1" :<CR>
" vmap -- :s:^\(\s*\):\1--:<CR>
" vmap /8 :s:^\(\s*\)\(.*\)$:\1/* \2 */:<CR>
" vmap h/ :s:^\(\s*\)\(.*\)$:\1<!-- \2 -->:<CR>
" " REMOVE
" vmap /d :s:^\(\s*\)// :\1:<CR>
" vmap 3d :s:^\(\s*\)# :\1:<CR>
" vmap "d :s:^\(\s*\)" :\1:<CR>
" vmap -d :s:^\(\s*\)--:\1:<CR>
" vmap 8d :s:^\(\s*\)\/\* \(.*\) \*\/$:\1\2:<CR>
" vmap hd :s:^\(\s*\)<!-- \(.*\) -->$:\1\2:<CR>
"}}}
" beautify JSON / XML"{{{
com! FormatJSON %!python -m json.tool
com! FormatXML  %!xmllint-1.0.exe "%" --format
	" this command required xmllint-1.0.exe
	" which can be downloaded from here: https://code.google.com/archive/p/xmllint/downloads
"}}}
"}}}

" Plugin Manager (vim-plug)"{{{
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
" View"{{{
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='sol'
" let g:airline_theme='silver'
let g:airline_theme='lucius'
" let g:airline_powerline_fonts = 1

" Plug 'altercation/vim-colors-solarized'

" TODO: check if it is useful
" Plug 'captbaritone/better-indent-support-for-php-with-html'

Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/seoul256.vim'

" tmux statusline generator with airline theme
Plug 'edkolev/tmuxline.vim'
" for tmuxline + vim-airline integration
let g:airline#extensions#tmuxline#enabled = 1
" start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"
"}}}
" Tools "{{{
Plug 'scrooloose/nerdtree'
nnoremap <silent> <F5> :NERDTree<CR>

Plug 'tpope/vim-commentary'

" Plug 'pi314/boshiamy.vim'

" add quotes outside a word, e.g.:  Hello world!  ->  <q>Hello world!</q>
" Plug 'tpope/vim-surround'
"
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" :rename[!] {newname}
Plug 'danro/rename.vim'

" Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
let g:session_autosave='no'

" JavaScript Beautifyer
" Plugin 'pangloss/vim-javascript'
" Plugin 'maksimr/vim-jsbeautify'
" " autocmd FileType javascript	noremap <buffer> <c-f> :call JsBeautify()<cr>
" " autocmd FileType json		noremap <buffer> <c-f> :call JsonBeautify()<cr>
" " autocmd FileType jsx		noremap <buffer> <c-f> :call JsxBeautify()<cr>
" " autocmd FileType html		noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" " autocmd FileType css		noremap <buffer> <c-f> :call CSSBeautify()<cr>

" git
Plug 'airblade/vim-gitgutter'

" HTML
Plug 'mattn/emmet-vim'

" JSON
Plug 'elzr/vim-json'

" YCM
" Plug 'Valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"}}}
" markdown"{{{
" Plugin 'isnowfy/python-vim-instant-markdown'
" Plugin 'iamcco/markdown-preview.vim'
" Plugin 'suan/vim-instant-markdown'
" Plugin 'godlygeek/tabular'
" Plugin 'plasticboy/vim-markdown'
"}}}
" Initialize plugin system
call plug#end()
"}}}

if has('gui_running') "{{{
  " Hide Menu"{{{
  set guioptions-=m	" menu bar
  set guioptions-=T	" icons bar
  " set guioptions-=r	" right bar
  " set guioptions-=L	" left bar
  " nnoremap	<C-1>	:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  " nnoremap	<C-2>	:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
  " nnoremap	<C-3>	:if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
  "}}}
  " Toggle Menu Bar"{{{
  nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
  nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
  nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
  "}}}
  " Set GVim default height & width"{{{
  if has('win32') || has ('win64')	" if in windows
    set lines=24 columns=80
  endif
  "}}}
  " GVim font"{{{
  if has('win32') || has ('win64')	" if in windows
    " set t_Co=256
    set guifont=Powerline_Consolas:h12
    " set guifont=Consolas:h12
    " set linespace=8
    " let g:airline_powerline_fonts = 1
  else	" if in Ubuntu
    set guifont=Ubuntu\ Mono\ 13
    " let g:airline_powerline_fonts = 1
  endif
  "}}}
  " Let Gvim Control 輸入法{{{
  if has('win32') || has ('win64')	" if in windows
    set imactivatekey=C-space
    inoremap <ESC> <ESC>:set iminsert=0<CR>
  endif
  "}}}
  " Set Language to utf-8{{{
  if has('win32') || has ('win64')	" if in windows
    let $LANG="zh_TW.UTF-8"
    set langmenu=zh_tw.utf-8
    set encoding=utf8
  endif
  "}}}
  "reload menu with UTF-8 encoding{{{
  if has('win32') || has ('win64')	" if in windows
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
  endif
  "}}}
endif
"}}}

" vim: set foldmethod=marker:
