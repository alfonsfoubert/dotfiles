-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- use it to move selected code up and down

-- use it to move selected code up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected code down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected code up" })

-- mantain terms in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
