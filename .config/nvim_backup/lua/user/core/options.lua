local opt = vim.opt

-- BASIC BEHAVIORS
opt.mouse = 'a' -- allows the mouse to be used
opt.clipboard = 'unnamedplus' -- allows neovim to access the system / OS clipboard and sync
opt.backup = false -- don't create backup file
opt.swapfile = false -- creates a swap file
opt.undofile = true -- enable persistent undo
opt.updatetime = 250 -- faster completion (4000ms default)
opt.timeoutlen = 300 -- decrease mapped sequence time, display which-key popup sooner
opt.completeopt = { 'menuone', 'noselect' } -- mostly just for cmp
opt.pumheight = 10 -- pop-up menu height

-- SPLITTING WINDOWS
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splist to go to the right of current window

-- COLORSCHEME
opt.termguicolors = true -- render the full range of theme colors instsead of estimating

-- CURSOR UI
opt.scrolloff = 10 -- min num of lines to keep above and below cursor
opt.sidescrolloff = 10 -- min num of cols to keep left and right of cursor
opt.cursorline = true -- highlight the line the cursor is on for visibility
opt.cursorcolumn = true -- highlight the column of the cursor for visibility

-- STATUS BAR
opt.showmode = false -- don't show the mode, since it's already in status line

-- COLUMNS
opt.number = true -- set numbered lines
opt.numberwidth = 2 -- set number column width to 2 (default is 4)
opt.signcolumn = 'yes' -- always show sign column, otherwise it shifts text

-- CHARS
opt.list = true -- show tabs, trailing space, etc
opt.listchars = {
  tab = '>--', -- Tabs display
  --space = '·',            -- Spaces dispay
  --eol = '$',              -- End of line display
  trail = '~', -- Trailing spaces display
  extends = '>', -- Extending beyond screen right display
  precedes = '<', -- Extending beyond screen left display
  nbsp = '␣', -- Non-breaking spaces display
}
opt.showmatch = true -- briefly jump to matching parenthesis to confirm match

-- TABS & INDENTATION
opt.tabstop = 2 -- tab is N spaces long
opt.shiftwidth = 2 -- spaces for auto-indent
opt.expandtab = true -- convert tabs to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.showtabline = 2 -- always show tabs
opt.breakindent = true -- wrap line and put an indent to show where it wraps

-- SEARCH & REPLACE
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- don't ignore case if search includes capitals
opt.inccommand = 'split' -- preview substitutions live, as you type (:s/word1/word2)
opt.hlsearch = true -- set highlight on search

vim.filetype.add({
  filename = {
    Brewfile = 'ruby',
  },
})
