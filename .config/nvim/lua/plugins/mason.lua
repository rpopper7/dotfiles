return {
    "mason-org/mason.nvim", -- tool for installing LSP (language server protocols)
    dependencies = {
        'mason-org/mason-lspconfig.nvim', -- bridge mason with LSP names
        'WhoIsSethDaniel/mason-tool-installer.nvim', -- installer for non-LSP tools
    },
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls" -- Lua LSP
            },
            automatic_installation = true,
        }

        require("mason-tool-installer").setup {
            ensure_installed = {
                "selene", -- Lua linter
                "stylua", -- Lua formatter
            },
            auto_update = false,
        }

        -- NOTE: not sure this LSP stuff really has to be here in neovim 0.11
        -- I should probaby move it somewhere else tbh 

        -- Diagnostic configuration
        vim.diagnostic.config {
            virtual_text = { current_line = true }, -- show inline messages
            underline = true, -- underline problematic text
            update_in_insert = false, -- don't update diagnostics while typing
            severity_sort = true, -- sort diagnostics by severity
            signs = {
                -- custom gutter signs
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = "",
                }
            }
        }

        -- Lua LSP specific configuration
        vim.lsp.config("lua_ls", {
            cmd = { 'lua-language-server' },
            filetypes = { 'lua' },
            root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { "vim" } }
                },
            },
        })
        vim.lsp.enable("lua_ls")
    end,
}
