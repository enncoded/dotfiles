cmd 'packadd paq-nvim'

local paq = require('paq-nvim').paq
paq{"savq/paq-nvim", opt = true}
paq{'embark-theme/vim', as = 'embark'}
paq{'glepnir/galaxyline.nvim', branch = 'main'}
paq{'unblevable/quick-scope'}
paq{'wellle/targets.vim'}
paq{'machakann/vim-sandwich'}
paq{'Raimondi/delimitMate'}
paq{'tpope/vim-fugitive'}
paq{'lukas-reineke/indent-blankline.nvim'}
paq{'tpope/vim-vinegar'}
paq{'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
paq{'tpope/vim-repeat'}
paq{'junegunn/fzf', run = fn['fzf#install']}
paq{'junegunn/fzf.vim'}
paq{'ojroques/nvim-lspfuzzy'}
paq{'Shougo/echodoc.vim'}
paq{'vim-pandoc/vim-pandoc'}
paq{'vim-pandoc/vim-pandoc-syntax'}
--paq{'neoclide/coc.nvim', branch = 'release'}
paq{'kovetskiy/sxhkd-vim'}
paq{'triglav/vim-visual-increment'}
paq{'tpope/vim-surround'}
paq{'justinmk/vim-sneak'}
paq{'kyazdani42/nvim-web-devicons'}
paq{'neovim/nvim-lspconfig'}
paq{'nvim-lua/plenary.nvim'}
paq{'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}}
paq{'nvim-treesitter/nvim-treesitter'}
paq{'akinsho/bufferline.nvim'}
--paq{'shougo/deoplete-lsp'}
paq{'shougo/deoplete.nvim', run = fn['remote#host#UpdateRemotePlugins']}

