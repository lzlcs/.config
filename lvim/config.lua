-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
local conf = vim.opt

conf.cmdheight = 1
conf.guifont = "monospace:h17"
conf.ts = 4
conf.sw = 4
conf.relativenumber = true

local pre_input_method = 2052
function Switch_input_method(x)
    if (x == 1033) then
        pre_input_method =
            tonumber(vim.fn.system("~/.config/lvim/im-select.exe"), 10)
    elseif (x == 2052) then
        x = pre_input_method
    end

    vim.fn.system("~/.config/lvim/im-select.exe " .. x)
end

vim.api.nvim_create_autocmd(
    { "InsertEnter", "FocusGained" },
    { command = "lua Switch_input_method(2052)" })
vim.api.nvim_create_autocmd(
    { "InsertLeave", "FocusLost" },
    { command = "lua Switch_input_method(1033)" })

