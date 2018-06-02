".vimrc for basic setting
set number
set nocompatible
set smartindent
set autoindent
set ruler
set ts=4
set sw=4
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
syntax on
set incsearch
set encoding=utf-8
filetype indent on
set mouse=a
let mapleader=","
set tags=./tags

" For putty 256 color
if &term == "xterm"
    set t_Co=256
endif

" For tmux scrolling
set term=screen-256color

"" Plugin Settings
" airline setting
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'

" NERDTree setting
let g:NERDTreeWinSize=20
let NERDTreeQuitOnOpen=1
autocmd BufEnter * lcd %:p:h

" autopairs setting
let g:AutoPairsShortcutFastWrap = '<C-w>'

" NERD Commenter
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
" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
 
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-std=c++11 -pthread -Wall -Wextra -Wpedantic"
let g:syntastic_c_compiler_options = "-std=c11 -Wall -Wextra -Wpedantic"

"ctrlp settings
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

""Custom Keyboard Shortcuts
map <F1> :NERDTree<CR>
"Compile this code
map <F5> :w<CR>:call Compile()<CR>
"Run this program
map <F6> :w<CR>:call Run()<CR>
"Edit input.txt file
map <F7> :w<CR>:vs input.txt<CR>
"Run this program with input.txt
map <F8> :w<CR>:call InputRun()<CR>
"cat this code for copy
map <F9> :w<CR>:!cat %<CR>
"move between tabs
map <C-f> :tabnext<CR>
inoremap <C-f> <ESC>:tabnext<CR>
inoremap <C-S-f> <ESC>:tabprevious<CR>
":tn becomes :tabnew
cnoreabbrev tn tabnew
map H 3h
map J 3j
map K 3k
map L 3l

function Compile()
    let a = &filetype
    echom a
    if a == "cpp"
        :!g++ -std=c++11 % -o %:r
    elseif a == "c"
        :!gcc % -o %:r
    elseif a == "java"
        :!javac %
    else
        echom "I cannot recognize :("
    endif
endfunction

function Run()
    let a = &filetype
    echom a
    if a=="cpp" || a=="c"
        :!./%:r
    elseif a == "python"
        :!python3 %
    elseif a == "ruby"
        :!ruby %
    elseif a == "php"
        :!php %
    elseif a == "javascript"
        :!nodejs %
    elseif a == "java"
        :!java %:r
    else
        echo "I cannot recognize :("
    endif
endfunction

function InputRun()
    let a = &filetype
    echom a
    if a == "cpp" || a == "c"
        :!time ./%:r < input.txt
    elseif a == "python"
        :!time python3 % < input.txt
    elseif a == "java"
        :!time java %:r < input.txt
    else
        echo "I cannot recognize :("
    endif
endfunction


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" NerdTree
Plugin 'scrooloose/nerdtree'

Plugin 'auto-pairs'
Plugin 'AutoComplPop'

" Vim 상태표시줄 바꿈
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" airline에 git 상태 표시
Plugin 'airblade/vim-gitgutter'

" airline에 branch 표시
Plugin 'tpope/vim-fugitive'

" airline에 문법오류 표시
Plugin 'scrooloose/syntastic'

" 파일 빠르게 찾기
Plugin 'ctrlpvim/ctrlp.vim'

" 자동 주석처리
Plugin 'scrooloose/nerdcommenter'

" 색상 테마 변경
Plugin 'nanotech/jellybeans.vim'

" 자동 컴파일 에러 찾기
Plugin 'Syntastic'

" Plugin 'Valloric/YouCompleteMe'
" autocompletion library
" Plugin 'jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin 'nanotech/jellybeans.vim' 필요
colorscheme jellybeans 
