local create_cmd = vim.api.nvim_create_autocmd

local create_group = vim.api.nvim_create_augroup
local exec_cmd = vim.api.nvim_exec_autocmds

local new_file = create_group("new_file", {clear = true})

create_cmd({"BufNewFile"}, {
    group = new_file,
    pattern = {'*.py'},
    command = '0r /home/mathledantec/.config/nvim/templates/template.py',
    desc = 'Opens a template when entering a new file.',
})



