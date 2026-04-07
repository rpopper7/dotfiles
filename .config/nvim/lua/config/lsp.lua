-- Diagnostic configuration
vim.diagnostic.config {
    virtual_text = { current_line = true }, -- show inline messages
    underline = true, -- underline problematic text
    update_in_insert = false, -- don't update diagnostics while typing
    severity_sort = true, -- sort diagnostics by severity
    signs = {
        -- custom gutter signs
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        }
    }
}

-- Lua LSP configuration
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

-- TypeScript/JavaScript LSP configuration
vim.lsp.config("ts_ls", {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
})

vim.lsp.enable({ "lua_ls", "ts_ls" })
