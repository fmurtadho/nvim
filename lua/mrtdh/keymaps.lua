vim.g.mapleader = " "

local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>wqa<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- NeoTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>")
map("n", "<leader>r", "<CMD>Neotree focus<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")

-- Dismiss Noice
map("n", "<leader>nd", "<CMD>NoiceDismiss<CR>")

-- Function to close buffer and switch to the previous one
local function close_buffer()
  vim.cmd('bd')  -- Close the current buffer
  vim.cmd('b#')  -- Switch to the previous buffer
end

-- Bufferline
vim.keymap.set("n", "<leader>bc", close_buffer, { silent = true, desc = "Close Current Buffer and Switch to Previous" })
vim.keymap.set("n", "<leader>[", ":bp<CR>", { silent = true, desc = "Buffer Previous" })
vim.keymap.set("n", "<leader>]", ":bn<CR>", { silent = true, desc = "Buffer Next" })
vim.keymap.set("n", "<leader>z", ":BufferLineCloseOther<CR>", { silent = true, desc = "Close Other Buffer" })
vim.keymap.set("n", "<leader>bl", ":BufferLinePick<CR>", { silent = true, desc = "Jump Between Buffer" })
