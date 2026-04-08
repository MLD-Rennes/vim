local mode_map = {
    ['n'] = 'Normal',
    ['no'] = 'N·operator pending',
    ['v'] = 'Visual',
    ['V'] = 'V·line',
    [''] = 'V·block',
    ['s'] = 'Select',
    ['S'] = 'S·line',
    [''] = 'S·block',
    ['i'] = 'Insert',
    ['R'] = 'Replace',
    ['Rv'] = 'V·replace',
    ['c'] = 'Command',
    ['cv'] = 'Vim Ex',
    ['ce'] = 'Ex',
    ['r'] = 'Prompt',
    ['rm'] = 'More',
    ['r?'] = 'Confirm',
    ['!'] = 'Shell',
    ['t'] = 'Terminal',
}

local function mode()
    local m = vim.api.nvim_get_mode().mode
    if mode_map[m] == nil then return m end
    return mode_map[m]
end

vim.api.nvim_exec(
[[
  hi PrimaryBlock ctermfg=White ctermbg=DarkBlue
  hi SecondaryBlock ctermfg=White ctermbg=Black
  hi Blanks ctermfg=White ctermbg=Black
]], false)

function stl()
    return table.concat {
    '%#PrimaryBlock#',
    mode(),
    '%#SecondaryBlock#',
    '%#Blanks#',
    ' %f',
    '%m',
    '%=',
    '%#SecondaryBlock#',
    '%l, %c, %p%% ',
    '%#PrimaryBlock#',
    '%{&filetype}',
    }
end

vim.o.statusline = "%!luaeval('stl()')"
