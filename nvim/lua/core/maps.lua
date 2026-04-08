local map = vim.api.nvim_set_keymap

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local options = { noremap = true }
-- I finished Dark Souls 1, 2 AND 3.
-- I play Vim the hardcore way
map('n', '<up>', '<nop>', options)
map('n', '<down>', '<nop>', options)
map('n', '<left>', '<nop>', options)
map('n', '<right>', '<nop>', options)
map('i', '<up>', '<nop>', options)
map('i', '<down>', '<nop>', options)
map('i', '<left>', '<nop>', options)
map('i', '<right>', '<nop>', options)
map('i', '<esc>', '<nop>', options)
map('v', '<up>', '<nop>', options)
map('v', '<down>', '<nop>', options)
map('v', '<left>', '<nop>', options)
map('v', '<right>', '<nop>', options)
map('v', '<esc>', '<nop>', options)

-- People suck but I still want to
-- be able to go out of Vim's insert mode
-- at some points in order to eat and sleep.
map('i', 'jk', '<esc>', options)
map('v', 'jk', '<esc>', options)

-- Surround visually selected region by ' or " in visual mode
map('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', options)
map('n', '<leader>\'', 'viw<esc>a\'<esc>bi\'<esc>lel', options)
map('v', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel', options)
map('v', '<leader>\'', 'viw<esc>a\'<esc>bi\'<esc>lel', options)

-- Goes back to explore files mode
map('n', "<leader>pv", ":Ex<CR>", options)

--Ensure search uses very magic mode
map('n', '/', '/\\v', options)

-- THE LONG AWAITED STOP THIS GODDAMM HILIGHTSEARCH COMMAND
map('n', '<leader>/', ':nohlsearch<CR>', options)
