return {
    -- incrementally parses for better syntax highlighting and code navigation
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
	require('nvim-treesitter.configs').setup({
	    highlight = { enable = true },
	    indent = { enable = true },
	    autotag = { enable = true },
	    ensure_installed = { "css", "gitignore", "html", "javascript", "lua", "tsx", "typescript" },
	    auto_install = false,
	})
    end
}
