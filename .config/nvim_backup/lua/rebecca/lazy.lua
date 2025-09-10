-- BOOTSTRAPS LAZY
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'rebecca.plugins' },
}, {
  checker = {
    enabled = true, -- automatically check for plugin updates
    notify = false, -- don't notify on plugin auto-update
  },
  change_detection = {
    notify = false, -- don't notify on plugin change
  },
})
