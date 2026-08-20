vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/hrsh7th/cmp-nvim-lsp",
  "https://github.com/antosha417/nvim-lsp-file-operations",
})
--
-- Customize error signs
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})
-- Python
vim.lsp.config("pylsp", {
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        -- linter options
        pyflakes = { enabled = false },
        pycodestyle = {
          enabled = true,
          ignore = { "E203", "E501", "E701" },
        },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = true },
        -- import sorting
        pylsp_isort = { enabled = true },
        rope_completion = { enabled = true },
        rope_autoimport = {
          enabled = true,
        },
      },
    },
  },
})

vim.lsp.config("ruff", {
  settings = {
    init_options = {
      settings = {
        -- Arguments par défaut de la ligne de commande ruff
        -- (on ajoute les warnings pour le tri des imports)
        args = { "--extend-select", "I" },
      },
    },
  },
})
vim.lsp.config("lmp_lsp", {
  cmd = { "/home/mathledantec/.cargo/bin/lmp-lsp" },
  filetypes = { "lammps" },
--      root_dir = function(bufnr)
--        return vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
--      end,
})
vim.lsp.enable("lmp_lsp")
