local basic = vim.opt
-- 设置缩进选项
basic.tabstop = 4
basic.shiftwidth = 4
basic.expandtab = true
-- 设置行号
basic.number = true
basic.relativenumber =  true
-- 关闭兼容
basic.compatible = false

local simple = { noremap = true, silent = true }

vim.g.mapleader = ' '

local mappings = {
    { "n", "<leader><leader>", ":source $MYVIMRC<CR>", simple },
    { "n", "<leader>s", ":w<CR>", simple },
    { "n", "<leader>q", ":q<CR>", simple },
    { "n", "<leader>v", ":edit $MYVIMRC<CR>", simple },
    { "n", "<esc>", ":noh<CR>", simple },
    -- Terminal
    { "t", "<C-[>", "<C-\\><C-n>", simple },
    -- Buffers
    { "n", "<leader>bh", ":bn<CR>", simple },
    { "n", "<leader>bl", ":bp<CR>", simple },
    { "n", "<leader>ba", ":ls<CR>", simple },
    { "n", "<leader>bc", ":bdelete<CR>", simple },
    -- Windows
    { "n", "<leader>wh", "<C-w>h", simple },
    { "n", "<leader>wl", "<C-w>l", simple },
    { "n", "<leader>wj", "<C-w>j", simple },
    { "n", "<leader>wk", "<C-w>k", simple },
    { "n", "<leader>wu", "<C-w>v<C-w>l", simple },
    { "n", "<leader>wi", "<C-w>s<C-w>k", simple },
    -- Tabs
    { "n", "<leader>tn", ":tabnew<CR>", simple }, 
    { "n", "<leader>th", ":tabn<CR>", simple }, 
    { "n", "<leader>tl", ":tabp<CR>", simple }, 
    { "n", "<leader>tc", ":tabclose<CR>", simple }, 
    -- Edit
    { "n", "H", "^", simple },
    { "n", "L", "$", simple },
}

for _, map in ipairs(mappings) do
    vim.api.nvim_set_keymap(unpack(map))
end


-- 切换输入法
pre_input_method = 2052

function switch_input_method(input_method)
--  local current_mode = vim.api.nvim_get_mode().mode

--   if current_mode == "n" then
--        pre_input_method = vim.fn.system("~/.config/nvim/im-select.exe"):sub(1, 4)
--    end

    vim.fn.system("~/.config/nvim/im-select.exe " .. input_method)
end

vim.cmd([[autocmd InsertEnter * lua switch_input_method(pre_input_method)]])
vim.cmd([[autocmd InsertLeave * lua switch_input_method(1033)]])


print("Config loaded")


