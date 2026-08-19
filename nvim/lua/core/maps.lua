--local map = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local options = { noremap = true }

local function map(mode, lhs, rhs, extra)
   -- Fusionne options générales avec options spécifique à chaque mappings
   vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend("force", options, extra or {}))
end

map('n', '<Space>', '', {})
vim.g.mapleader = ' '

-- I finished Dark Souls 1, 2 AND 3.
-- I play Vim the hardcore way
map('n', '<up>', '<nop>')
map('n', '<down>', '<nop>')
map('n', '<left>', '<nop>')
map('n', '<right>', '<nop>')
map('i', '<up>', '<nop>')
map('i', '<down>', '<nop>')
map('i', '<left>', '<nop>')
map('i', '<right>', '<nop>')
map('v', '<up>', '<nop>')
map('v', '<down>', '<nop>')
map('v', '<left>', '<nop>')
map('v', '<right>', '<nop>')

-- People suck but I still want to
-- be able to go out of Vim's insert mode
-- at some points in order to eat and sleep.
map('i', 'jk', '<esc>', { desc = "Sortir du mode édition" })
map('v', '<C-j><C-k>', '<esc>', { desc = "Sortir du mode visuel" })

map('n', '<leader>"', 'ciw\"<C-r>\"\"<esc>', { desc = "Entourer de guillemets le mot suivant." })
map('n', '<leader>\'', 'ciw\'<C-r>\"\'<esc>', { desc = "Entourer de guillemets simples le mot suivant" })
map('v', '<leader>\"', 'c\"<C-r>\"\"<esc>', { desc = "Entourer de guillemets la sélection" })
map('v', '<leader>\'', 'c\'<C-r>\"\'<esc>', { desc = "Entourer de guillemets simple la sélection" })

map('n', "<leader>pv", ":Ex<CR>", { desc = "Retourner au mode 'explorer fichier'" })

map('n', '/', '/\\v', { desc = "Recherche avec mode magique" })

map('n', '<leader>/', ':nohlsearch<CR>', { desc = "Arrêter la surbrillance" })

-- Changement de fenêtre avec Ctrl + déplacement uniquement au lieu de Ctrl-w + déplacement
map("n", "<C-h>", "<C-w>h", { desc = "Déplace le curseur dans la fenêtre de gauche" })
map("n", "<C-j>", "<C-w>j", { desc = "Déplace le curseur dans la fenêtre du bas" })
map("n", "<C-k>", "<C-w>k", { desc = "Déplace le curseur dans la fenêtre du haut" })
map("n", "<C-l>", "<C-w>l", { desc = "Déplace le curseur dans la fenêtre de droite" })


