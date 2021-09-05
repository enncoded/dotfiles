local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

opt.termguicolors = true
cmd 'colorscheme embark'

opt.clipboard = 'unnamedplus'
opt.filetype.plugin = 'on'

opt.syntax = 'on'
opt.background = 'dark'
opt.hidden = true
opt.number = true
opt.autoindent = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smarttab = true
opt.expandtab = true

opt.shell = '/bin/zsh'
opt.ruler = true
opt.ignorecase = true
opt.smartcase = true
opt.backspace = {'indent', 'eol', 'start'}
opt.relativenumber = true

opt.updatetime = 300
opt.signcolumn = 'yes'

-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
opt.completeopt = {'menuone', 'noselect'}
opt.shortmess:append('c')

opt.mouse = 'a'
g['session_autoload'] = 'no'

opt.undofile = true
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'

g['python_host_prog'] = os.getenv('HOME') .. '/.pyenv/versions/neovim2/bin/python2'
g['python3_host_prog'] = os.getenv('HOME') .. '/.pyenv/versions/neovim3/bin/python3'

-- Echodoc
opt.cmdheight = 2
g['noshowmode'] = true

cmd [[autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()]]
cmd [[autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()]]
-- Enable type inlay hints
cmd [[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = 'Comment', enabled = {'TypeHint', 'ChainingHint', 'ParameterHint'}}]]

