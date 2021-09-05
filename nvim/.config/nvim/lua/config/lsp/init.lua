--LSP
local lsp = require 'lspconfig'
--local lspfuzzy = require 'lspfuzzy'

--lspfuzzy.setup {}  -- Make the LSP client use FZF instead of the quickfix list
-- Using default settings. The option table can stay empty
lsp.ccls.setup {}
lsp.pylsp.setup {}

local sumneko_root_path = os.getenv('HOME') .. '/tools/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/Linux/lua-language-server'
lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = {
                    '?.lua',
                    '?/init.lua',
                    vim.fn.expand'~/.luarocks/share/lua/5.4/?.lua',
                    vim.fn.expand'~/.luarocks/share/lua/5.4/?/init.lua',
                    '/usr/share/5.4/?.lua',
                    '/usr/share/lua/5.4/?/init.lua'
                }
            },
            completion = {enable = true, callSnippet = 'Both'},
            diagnostics = {
                enable = true,
                globals = {'vim', 'describe'},
                disable = {'lowercase-global'}
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            },
            -- adjust these two values if your performance is not optimal
            maxPreload = 2000,
            preloadFileSize = 1000
        }
    }
}

-- function to attach completion when setting up lsp
--local on_attach = function(client)
--    require'completion'.on_attach(client)
--end

lsp.rust_analyzer.setup {}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)


