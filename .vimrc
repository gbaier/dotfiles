set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'w0rp/ale'
Plugin 'dracula/vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set number
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=5
set hls

"case-insensitive search
set ignorecase
colorscheme dracula
filetype plugin on
filetype indent on
au BufEnter *.tex set autowrite
let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,dvi'
let g:Tex_CompileRule_pdf = 'pdflatex --shell-escape -interaction=nonstopmode $*'
let g:Tex_CompileRule_bib = 'biber $*'
let g:Tex_GotoError = 0
let g:Tex_ViewRule_pdf = 'okular'
" no spell check in comments
let g:tex_comment_nospell= 1
let g:haddock_browser="/usr/bin/firefox"
let g:haddock_docdir="/usr/lib/ghc-doc/haddock"

au BufEnter *.hs compiler ghc

set wildmode=longest,list

map <C-I> :pyf /home/gerald/.vim/clang-format.py<cr>
imap <C-I> <c-o>:pyf /home/gerald/.vim/clang-format.py<cr>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_linters = {'cpp': ['clang', 'clangcheck', 'cppcheck', 'cpplint', 'flawfinder', 'gcc']}
let g:ale_cpp_clangtidy_options = '-Wall -std=c++14 -x c++'
let g:ale_cpp_clangcheck_options = '-- -Wall -std=c++14 -x c++'

let g:yapf_style = "pep8"
:nnoremap <leader>y :call Yapf()<cr>

let g:clang_library_path='/usr/lib64/libclang.so'
