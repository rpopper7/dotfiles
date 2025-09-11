vim.g.mapleader = " " -- leader key is the spacebar

-- Navigate to file explorer with " cd"
vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)

-- Write to the file
vim.keymap.set("n", "<leader>w", ":write<CR>")
-- Exit the file
vim.keymap.set("n", "<leader>q", ":quit<CR>")
