if has('nvim') || has('termguicolors')
    set termguicolors
endif

colorscheme challenger_deep

let g:challenger_deep_termcolors = 16

set encoding=utf-8

call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'unblevable/quick-scope'
Plug 'wellle/targets.vim'
Plug 'machakann/vim-sandwich'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'thaerkh/vim-indentguides'
Plug 'tmhedberg/SimpylFold'
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'tpope/vim-vinegar'
Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/echodoc.vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

call plug#end()

filetype plugin on

syntax on
set background=dark

set hidden
set number
set autoindent

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

set shell=/bin/zsh
set ruler
set ignorecase
set smartcase
set backspace=indent,eol,start
set laststatus=2
set relativenumber
"set matchpairs+=<:>

set mouse=a

let g:session_autoload = 'no'

" Persistent undo
set undofile
set undodir=~/.vim/undodir

"vim-autoformat
noremap <F3> :Autoformat<CR>
let g:formatters_python = ['autopep8']

"ECHODOC
set cmdheight=2
set noshowmode

"COC
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif " Close preview window when done

"Coc-Highlight
autocmd FileType json syntax match Comment +\/\/.\+$+

" c-j c-k for moving in snippet
"imap <expr> <c-u> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
"smap <c-u> <Plug>(ultisnips_expand)
imap <c-u> <Plug>(ultisnips_expand)
let g:UltiSnipsExpandTrigger		= "<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

"ALE
let g:ale_linters = {
            \ 'c': ['clang'],
            \ 'cpp': ['clangtidy', 'cppcheck', 'cpp-lint', 'clang'],
            \ 'python': ['flake8']
            \ }
let g:ale_python_flake8_executable = 'python3'
let g:ale_python_flake8_use_global = 1
let g:ale_cpp_clang_options = '-std=c++11 -Wall'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503,E266,E261,E303,E302'

"PANDOC
let g:pandoc#command#custom_open = 'MyPandocOpen'
" I use zathura, you might use something else
function! MyPandocOpen(file)
    return 'zathura ' . shellescape(expand(a:file,':p'))
endfunction
com PandocInsModeline :normal Go[modeline]: # ( vim: set ft=pandoc: )<ESC>
let g:pandoc#biblio#sources = "bcg"
let g:pandoc#filetypes#handled = ["pandoc"]
let g:pandoc#filetypes#pandoc_markdown = 0
let g:pandoc#formatting#mode = 'hA'
let g:pandoc#command#autoexec_on_writes = 1
let g:pandoc#command#autoexec_command = 'Pandoc pdf -s'
com PandocOpen Pandoc! pdf -s

"LIGHTLINE
let g:lightline = {
            \ 'colorscheme': 'challenger_deep',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status'
            \ },
            \ }

"GITGUTTER
set updatetime=100

"HELPING VIM WORK BETTER WITH GIT
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' "Highlight commit merge conflict markers

"CTRL-P
" Set no max file limit
let g:ctrlp_max_files = 0
" Search from current directory instead of project root
let g:ctrlp_working_path_mode = 0

"map F1 key to :w
nmap <F1> :w<CR>
imap <F1> <Esc>:w<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
" Show doctrings
let g:SimpylFold_docstring_preview=1

"making sure mouse works correctly
if !has('nvim')
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
endif

let g:clang_library_path='/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib'
let g:ncm2_pyclang#library_path='/usr/local/Cellar/llvm/6.0.0/lib/libclang.dylib'

