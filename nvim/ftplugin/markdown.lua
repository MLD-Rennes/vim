local map = vim.api.nvim_set_keymap
map('n', '<leader>**', 'ciw**<C-r>"**<esc>jk', {
            desc = "Mettre en mot en gras."
        })
map('n', '<leader>*', 'ciw*<C-r>"*<esc>jk', {
            desc = "Mettre en mot en itallique."
        })
map('v', '<leader>**', 'c**<C-r>"**<esc>jk', {
            desc = "Mettre en mot en gras."
        })
map('v', '<leader>*', 'c*<C-r>"*<esc>jk', {
            desc = "Mettre en mot en itallique."
        })
