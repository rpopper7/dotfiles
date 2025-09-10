return {
    -- a soft, pastel-themed neovim color scheme
    "catppuccin/nvim",
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
	    flavour = "auto", -- auto switch flavor based on bg
	    background = { -- flavors include latte, frappe, macchiato, mocha
	        light = "macchiato", 
	        dark = "mocha",
	    },
	    term_colors = true, -- override terminal colors
	    transparent_background = true,
	    auto_integrations = true,
    },
    config = function(_, opts)
    	require("catppuccin").setup(opts)
	    vim.cmd.colorscheme("catppuccin")

	    -- brighten numbers on side of vim that get blurry in transparent bg view
        local colors = require("catppuccin.palettes").get_palette()
	    vim.api.nvim_set_hl(0, "LineNr", { fg = colors.overlay1,  bg = "none" })
    end
}
