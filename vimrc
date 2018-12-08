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
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
"Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'thaerkh/vim-indentguides'
Plug 'tmhedberg/SimpylFold'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-pyclang'
Plug 'SirVer/ultisnips'
Plug 'ncm2/ncm2-ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-vinegar'
Plug 'Chiel92/vim-autoformat'
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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

set pastetoggle=<F10>
set mouse=a

let g:session_autoload = 'no'

" Persistent undo
set undofile
set undodir=~/.vim/undodir

"vim-autoformat
noremap <F3> :Autoformat<CR>
let g:formatters_python = ['autopep8']

"LANGUAGECLIENT
let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/cc.log', '--init={"cacheDirectory":"/Users/aquamarine/languageserver"}'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log', '--init={"cacheDirectory":"/Users/aquamarine/languageserver"}'],
    \ 'python': ['pyls', '--log-file=/tmp/cc.log', '--init={"cacheDirectory":"/Users/aquamarine/languageserver"}']
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/aquamarine/.config/nvim/settings.json'
let g:LanguageClient_hasSnippetSupport = 0
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nn <silent> <M-j> :call LanguageClient#textDocument_definition()<cr>
nn <silent> <C-,> :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
nn <silent> K :call LanguageClient#textDocument_hover()<cr>
set signcolumn=yes

"NCM2
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" a list of relative paths for compile_commands.json
let g:ncm2_pyclang#database_path = [
            \ 'compile_commands.json',
            \ ]

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9, 
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })

" Press enter key to trigger snippet expansion
" The parameters are the same as `:help feedkeys()`
" inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

" c-j c-k for moving in snippet
imap <expr> <c-u> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
smap <c-u> <Plug>(ultisnips_expand)
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
nmap <silent> <C-[> <Plug>(ale_previous_wrap)
nmap <silent> <C-]> <Plug>(ale_next_wrap)

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
let g:ale_python_flake8_options = '--ignore=E129,E501,E302,E265,E241,E305,E402,W503,E266,E261'

"LIGHTLINE
let g:lightline = {
            \ 'colorscheme': 'challenger_deep',
            \ }

"Register the components
let g:lightline.component_expand = {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \ }

"Color the components
let g:lightline.component_type = {
            \     'linter_checking': 'left',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'left',
            \ }

"Add components to the lightline
let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

"GITGUTTER
set updatetime=100

"HELPING VIM WORK BETTER WITH GIT
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' "Highlight commit merge conflict markers

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

let g:clang_library_path='/usr/lib64/libclang.so'
let g:ncm2_pyclang#library_path='/usr/lib64/libclang.so'

