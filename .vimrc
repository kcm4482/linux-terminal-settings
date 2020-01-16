
".vimrc for basic setting
set number
set nocompatible
set smartindent
set autoindent
set ruler
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set encoding=utf-8
set mouse=a
let mapleader=","
set backspace=indent,eol,start

syntax on
filetype indent on

" For colorful screen
set term=screen-256color

"" Plugin Settings
" NERDTree setting
let g:NERDTreeWinSize=20
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
" 현재 열린 버퍼의 위치로 현재 디렉토리 업데이트
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
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment


"" Custom Keyboard Shortcuts
map <F1> :NERDTreeToggle<CR>
" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
" Compile this code
map <F5> :w<CR>:call Compile()<CR>
" Run this program
map <F6> :w<CR>:call Run()<CR>
" Edit input.txt file
map <F7> :w<CR>:vs input.txt<CR>
" Run this program with input.txt
map <F8> :w<CR>:call InputRun()<CR>
" cat this code for copy
map <F9> :w<CR>:!cat %<CR>
" Move between tabs
map <C-f> :tabnext<CR>
inoremap <C-f> <ESC>:tabnext<CR>
inoremap <C-S-f> <ESC>:tabprevious<CR>

" :tn becomes :tabnew
cnoreabbrev tn tabnew

" Fast move
map H 3h
map J 3j
map K 3k
map L 3l

function Compile()
    let a = &filetype
    echom a
    if a == "cpp"
        :!g++ -std=c++14 % -o %:r
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


" vim-plug Plugin List
call plug#begin()

" NerdTree
Plug 'scrooloose/nerdtree'

" 자동 괄호 짝맞추기
Plug 'jiangmiao/auto-pairs'

" 자동 완성
" Plug 'valloric/youcompleteme'

Plug 'vim-scripts/AutoComplPop'

" 자동 주석처리
Plug 'scrooloose/nerdcommenter'

" 색상 테마 변경
Plug 'nanotech/jellybeans.vim'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

Plug 'liuchengxu/vista.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

call plug#end()


" Plugin 'nanotech/jellybeans.vim' 필요
colorscheme jellybeans
