set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"Plugins

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
Plugin 'grep.vim'

call vundle#end()            " required
"filetype plugin indent on    " required

set exrc
set backspace=2
set secure
set number
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set laststatus=2
set relativenumber
syntax on
colorscheme elflord

let g:NERDTreeDirArrowExpandable = '🠊'
let g:NERDTreeDirArrowCollapsible = '🠟'

" NASM syntax check
autocmd BufNewFile,BufRead *.asm set filetype=nasm

"Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++1z -stdlib=libc++'


"YCM Config

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nmap <C-G> :YcmCompleter GoToDefinition<CR>

"javacomplete2 Config

autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
nmap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)
imap <F7> <Plug>(JavaComplete-Imports-RemoveUnused)

"NERDTree Config

map <C-n> :NERDTree<CR>

"Airline Config
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

nmap <C-w>n :bn<CR>
nmap <C-w>p :bp<CR>
nmap <C-w>1 :bfirst<CR>
nmap <C-w>2 :bfirst<CR>:bn<CR>
nmap <C-w>3 :bfirst<CR>:2bn<CR>
nmap <C-w>4 :bfirst<CR>:3bn<CR>
nmap <C-w>5 :bfirst<CR>:4bn<CR>
