return {
  'catppuccin/nvim',
  lazy = false,
  priority = 1000,
  name = 'catppuccin', -- palettes are called latte, frappe, macchiato, mocha
  config = function()
    require('catppuccin').setup({
      flavour = 'macchiato', -- latte, frappe, macchiato, mocha
      integrations = {
        alpha = true,
        cmp = true,
        gitsigns = true,
        indent_blankline = {
          enabled = true,
        },
        mason = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    })
    vim.cmd.colorscheme('catppuccin')
  end,
}
