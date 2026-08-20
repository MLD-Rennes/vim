-- Note : la ligne de commande tree-sitter doit être installée sur votre système
vim.pack.add({
  "https://github.com/romus204/tree-sitter-manager.nvim",
})

local manager = require("tree-sitter-manager")
manager.setup({
  -- activation de la coloration syntaxique
  highlight = {
    enable = true,
  },
  -- activation de l'indentation améliorée
  indent = { enable = true },

  -- Options par défaut
  ensure_installed = {
    "bash",
    "csv",
    "gitignore",
    "json",
--    "lua",
--    "markdown",
--    "markdown_inline",
    "python",
    "tsv",
--    "vim",
    "yaml",
  }, -- la liste de tous les parsers à installer au démarrage de la session neovim. La valeur "all", installe tous les parsers.
  auto_install = true, -- installe les parsers manquant lors de l’édition d’un fichier
  -- Use built-in Neovim treesitter parsers
  noauto_install = {
    "c", "lua", "markdown", "markdown_inline", "query", "vim", "vimdoc"
    },
  -- lorse de l'appui sur <Ctrl-space> sélectionne le bloc
  -- courant spécifique au langage de programmation
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  }
})

