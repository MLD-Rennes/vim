local o = vim.o
local wo = vim.wo
local bo = vim.bo

--[[
  Dr. G.Clavier wonderful vimrc file
  General options
--]]
-- {{{
-- My colorset
--    vim.cmd('colorscheme turlututu')
    vim.cmd('syntax on')
-- Options I like
-- Wrap lines
    o.wrap = true
    o.showcmd = true
    o.cursorline = true
    o.wildmenu = true
    o.showmatch = true
    o.incsearch = true
    o.hlsearch = true
-- Changes default split behaviour
    o.splitbelow = true
    o.splitright = true
-- Makes all character visible. A bit annoying but useful sometimes
    o.listchars = 'nbsp:¬,eol:$,tab:>-,extends:»,precedes:«,trail:-'
    vim.cmd('set list')
-- Indent
    vim.cmd('filetype plugin indent on')
    o.ruler = true
-- Indent without fucking tabs
    o.tabstop = 4
    o.shiftwidth = 4
    o.expandtab = true
-- Display relative line number
    o.relativenumber = true
    vim.cmd('set colorcolumn=80')
    vim.cmd('highlight ColorColumn ctermbg=darkgrey')
    vim.cmd('highlight ColorColumn ctermbg=red')
-- Starts line with new comments below comment line
-- Only in insert mode
    vim.cmd('set formatoptions+=cr')
-- }}}
