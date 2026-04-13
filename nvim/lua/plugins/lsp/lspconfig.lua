return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- Va permettre de remplir le plugin de complétion automatique nvim-cmp
    -- avec les résultats des LSP
    "hrsh7th/cmp-nvim-lsp",
    -- Ajoute les « code actions » de type renommage de fichiers intelligent, etc
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- Utile pour éditer les fichiers lua spécifiques à la config neovim
    -- Notamment pour éviter le "Undefined global `vim`"
    { "folke/lazydev.nvim", opts = {} },
  },
  keys = {
    { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
    { "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP references", mode = "n" },
    { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", mode = "n" },
    { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions", mode = "n" },
    { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations", mode = "n" },
    { "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions", mode = "n" },
    { "gs", vim.lsp.buf.signature_help, desc = "Show LSP signature help", mode = "n" },
    { "<leader>rn", vim.lsp.buf.rename, desc = "Smart rename", mode = "n" },
    { "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", desc = "Show buffer diagnostics", mode = "n" },
    { "<leader>d", vim.diagnostic.open_float, desc = "Show line diagnostics", mode = "n" },
    {
      "[d",
      function()
        vim.diagnostic.jump({ count = -1, float = true })
      end,
      desc = "Go to previous diagnostic",
      mode = "n",
    },
    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1, float = true })
      end,
      desc = "Go to next diagnostic",
      mode = "n",
    },
    { "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor", mode = "n" },
    { "<leader>F", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", desc = "Format buffer", mode = { "n", "x" } },
    { "<leader>rs", ":LspRestart<CR>", desc = "Restart LSP", mode = "n" },
  },
  config = function()
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
              ignore = { "E501" },
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
    
   -- Configure the LSP
--   local util = require('lspconfig.util')
--   local configs = require('lspconfig.configs')
--   local lmp_default_config = {
--     cmd = { '/home/mathledantec/.cargo/bin/lmp-lsp' }, -- Make sure you change this to where this is located
--     filetypes = { 'lammps' },
--     root_dir = util.find_git_ancestor,
--     single_file_support = true,
--   }
--   configs.lmp_lsp = {
--     default_config = lmp_default_config,
--     docs = {
--       description = [[
--         "LAMMPS LSP server"
--         ]],
--       default_config = {
--         root_dir = [[util.find_git_ancestor]],
--       },
--     },
--   }
   vim.lsp.config("lmp_lsp", {})

--    vim.lsp.config("rumdl", {
--        cmd = { vim.fn.stdpath("data") .. "/mason/bin/rumdl", "server" },
--        filetypes = { "markdown" },
--        root_dir = function()
--            return vim.fn.getcwd()
--        end,
--    })
--
    vim.lsp.enable({ "pylsp" })
  end,
}
