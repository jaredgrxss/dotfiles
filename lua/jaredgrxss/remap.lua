vim.g.mapleader = " "
-- File explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Open a terminal vertically next to current window
vim.keymap.set("n", "<leader>vst", function()
	vim.cmd("vsplit | terminal")
end)
-- Exit insert mode in a terminal 
vim.keymap.set("t", "<Esc>", "<Cmd>stopinsert<CR>")
-- Shift to the left window
vim.keymap.set("n", "<leader>h", "<C-w>h")
-- Shift to the bottom window 
vim.keymap.set("n", "<leader>j", "<C-w>j")
-- Shift to the top window 
vim.keymap.set("n", "<leader>k", "<C-w>k")
-- Shift to the right window
vim.keymap.set("n", "<leader>l", "<C-w>l")
-- Changing default spacing
vim.o.tabstop = 4      -- Number of spaces a <Tab> counts for
vim.o.shiftwidth = 4   -- Number of spaces to use for autoindent
vim.o.softtabstop = 4  -- Number of spaces inserted when pressing Tab
vim.o.expandtab = true -- Convert tabs to spaces
