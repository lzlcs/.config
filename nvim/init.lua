require('basic')
require('keybindings')
require('plugins')
require('plugins-config.whichkey')

local colorscheme = "tokyonight"
vim.cmd('colorscheme ' .. colorscheme)


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
    { "InsertEnter" },
    { command = "lua Switch_input_method(2052)" })
vim.api.nvim_create_autocmd(
    { "InsertLeave" },
    { command = "lua Switch_input_method(1033)" })

print("Config loaded")
