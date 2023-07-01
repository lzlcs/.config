vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }

map("n", "<leader>ev", ":edit $MYVIMRC<CR>", opt)
map("n", "<leader>eb", ":edit ~/.config/nvim/lua/basic.lua<CR>", opt)
map("n", "<leader>em", ":edit ~/.config/nvim/lua/keybindings.lua<CR>", opt)
map("n", "<leader>ep", ":edit ~/.config/nvim/lua/plugins.lua<CR>", opt)
map("n", "<leader><leader>", ":so $MYVIMRC<CR>", opt)

map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>i", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>i", opt)
map("t", "<Esc>", "<C-\\><C-n>:q<CR>", opt)
map("t", "<C-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<C-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<C-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<C-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

