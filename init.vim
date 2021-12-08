" S - Setup

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" S - Plugins with VimPlug

call plug#begin('~/.vim/plugged')
""" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

""" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-eunuch'

""" AUTOCOMPLETE MADNESS
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/DoxygenToolkit.vim'

""" LINTERS
Plug 'rhysd/vim-clang-format'

""" NAVIGATION
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'

""" ASYNC RUN
Plug 'skywind3000/asyncrun.vim'

""" TEXT EDITING
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'luochen1990/rainbow'

""" COLORSCHEMES
Plug 'tomasiser/vim-code-dark'

call plug#end()

" S - Minimal

set nu
set relativenumber
set cursorline

" Disable all sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" S - Editing
set undodir=~/.neovim/undo
set undofile
set noswapfile

" Return to last edit position when opening the file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Code Format
autocmd FileType cpp,h,c noremap <leader><leader> :ClangFormat<CR>

" S - GUI Support
set mouse=a

" Spaces 1 x 0 Tabs
autocmd FileType cpp,h,c,json set tabstop=4
autocmd FileType dart,javascript,js,sh,py,python set tabstop=2

set expandtab

autocmd FileType cpp,h,c,json set shiftwidth=4
autocmd FileType dart,javascript,js,sh,py,python set shiftwidth=2

set smarttab
set autoindent

" Window Management
set splitright
set splitbelow

" Resizing
noremap <C-M-h> 3<C-w><
noremap <C-M-l> 3<C-w>>
noremap <C-M-k> 1<C-w>-
noremap <C-M-j> 1<C-w>+

" S - Shortcuts
let mapleader=','
let maplocalleader=';'

noremap <leader>t :tabnew<CR>
noremap <leader>n :new<CR>
noremap <leader>v :vnew<CR>
noremap <leader>q :q<CR>
noremap <leader>Q :q!<CR>

" Find file
noremap <leader>f :FZF<CR>
noremap <leader>F :e **/*

" Find in the project
noremap <leader>g y:Rg -j1 --glob "!{**/cmake.bld/**,compile_commands.json}" <C-r>"<CR>
noremap <leader>G y:Rg -j1 --glob "!{**/cmake.bld/**,compile_commands.json}" ""<Left>

" Go to .h and .cpp files
autocmd FileType cpp,h noremap <leader>c :e %<.cpp<CR>
autocmd FileType cpp,h noremap <leader>C :vnew %<.cpp<CR>
autocmd FileType cpp,h noremap <leader>h :e %<.h<CR>
autocmd FileType cpp,h noremap <leader>H :vnew %<.h<CR>

" Go to local CMakeLists.txt
noremap <leader>b :vnew %:p:h/CMakeLists.txt<CR>

" S - Searching
set wildignore+=**/cmake.bld/**,compile_commands.json
set incsearch
set ignorecase
nnoremap <leader>m :noh<CR>

" S - Theme
set t_Co=256
set t_ut=

try
    " colorscheme codedark
catch
endtry

" S - coc.nvim

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gb :bp<CR>
nmap <silent> gA :CocAction<CR>

" S - UltiSnips
let g:UltiSnipsSnippetDirectories=["~/.config/nvim/snippets/"]
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

" Maximize Current Window
noremap <leader>M <C-w>_<C-w><Bar> 

" Make open panels have the same size
noremap <leader>m <C-w>=

" Syntax
syntax enable

" S - Navigation
noremap <bslash><bslash> :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
