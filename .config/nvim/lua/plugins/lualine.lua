return {
    -- fast & easy to configure statusline (at bottom of screen)
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
	    theme = "catppuccin",
    },
    config = function(_, opts)
	require("lualine").setup({
	    options = opts,
	    sections = {
		-- custom x section with lazy update reminder
		lualine_x = {
		    {
			require("lazy.status").updates,
			cond = require("lazy.status").has_updates,
			color = { fg = "#ff9e65" },
		    },
		    { "encoding" },
		    { "fileformat" },
		    { "filetype" },
		},
	    },
	})
    end
}
