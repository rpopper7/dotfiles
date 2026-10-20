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
                "lua_ls",  -- Lua LSP
                "ts_ls",   -- TypeScript/JavaScript LSP
            },
            automatic_enable = false, -- servers are enabled in config/lsp.lua
        }

        require("mason-tool-installer").setup {
            ensure_installed = {
                "selene", -- Lua linter
                "stylua", -- Lua formatter
            },
            auto_update = false,
        }
    end,
}
