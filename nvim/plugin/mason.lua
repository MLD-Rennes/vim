vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

-- import de mason
local mason = require("mason")

-- import de mason-lspconfig
local mason_lspconfig = require("mason-lspconfig")

-- Active mason et personnalise les icônes
mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lspconfig.setup({
  automatic_enable = true,
  -- Liste des serveurs à installer par défaut
  -- List des serveurs possibles : https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
  -- Vous pouvez ne pas en mettre ici et tout installer en utilisant :Mason
  -- Mais au lieu de passer par :Mason pour installer, je vous recommande d'ajouter une entrée à cette liste
  -- Ça permettra à votre configuration d'être plus portable
  ensure_installed = {
    "lua_ls",
    "pylsp",
    "ruff",
    "rust_analyzer",
  },
})

