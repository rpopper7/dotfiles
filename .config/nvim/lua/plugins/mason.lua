-- tool for installing LSPs, linters, and formatters
return {
    "mason-org/mason.nvim",
    dependencies = { 'mason-org/mason-lspconfig.nvim' },
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls" -- lua LSP
            },
            automatic_installation = true,
        })

        -- NOTE: not sure this LSP stuff has to be here in neovim 0.11

        vim.diagnostic.config({
            virtual_text = { current_line = true }, -- show inline messages
            underline = true, -- underline problematic text
            update_in_insert = false, -- don't update diagnostics while typing
            severity_sort = true, -- sort diagnostics by severity
            signs = true, -- show signs in gutter
        })

        -- custom signs in gutter
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "",
                },
            },
        })

        -- lua setup
        vim.lsp.config['lua_ls'] = {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { { '.luarc.json', '.luarc.jsonc'}, '.git' },
            settings = {
                Lua = {
                    runtime = {
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
        vim.lsp.enable('lua_ls')
    end,
}
