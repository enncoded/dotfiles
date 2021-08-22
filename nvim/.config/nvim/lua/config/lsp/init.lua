--LSP
local lsp = require 'lspconfig'
local lspfuzzy = require 'lspfuzzy'

-- Using default settings. The option table can stay empty
lsp.ccls.setup {}
lsp.pylsp.setup {}
lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list

