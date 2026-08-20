local create_autocmd = vim.api.nvim_create_autocmd
create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if name == "LuaSnip" then
      if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
        run_build(name, { "make", "install_jsregexp" }, ev.data.path)
--        vim.system({ 'cmake', '-S.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release' },
--        { cwd = ev.data.path }, function(obj)
--            if obj.code ~= 0 then
--                vim.notify 'cmake --build failed for telescope-fzf-native.nvim'
--            else
--                vim.system({ 'cmake', '--build', 'build', '--config', 'Release', '--target', 'install' }, { cwd = ev.data.path })
--            end
--        end)

      end
      return
    end

      return
  end,
})

vim.pack.add({
  { src = "https://github.com/L3MON4D3/LuaSnip", version = vim.version.range("2.*") }, -- moteur de snippets
  "https://github.com/saadparwaiz1/cmp_luasnip", -- ajoute LuaSnip à l’autocompletion
  "https://github.com/rafamadriz/friendly-snippets", -- collection de snippets pratiques
  "https://github.com/onsails/lspkind.nvim", -- vs-code pictogrammes
  "https://github.com/hrsh7th/cmp-emoji", -- complétion d’émojis à la saisie de :
  "https://github.com/hrsh7th/cmp-cmdline", -- source pour les completions de la cmdline de vim
  "https://github.com/hrsh7th/cmp-path", -- source pour compléter les chemins des fichiers
  "https://github.com/hrsh7th/cmp-buffer", -- source pour compléter le texte déjà présent dans le buffer
  "https://github.com/hrsh7th/nvim-cmp",
})

local cmp = require("cmp")

local luasnip = require("luasnip")

local lspkind = require("lspkind")

-- chargement des snippets (e.g. friendly-snippets)
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noselect",
  },
  snippet = { -- on utilise luasnip comme moteur de snippets
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-b>"] = cmp.mapping.scroll_docs(-1),
    ["<C-f>"] = cmp.mapping.scroll_docs(1),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accepte la sélection courante. Mettre à `false` pour ne confirmer que les items explicitement sélectionnés
  },

  -- sources pour l’autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- lsp
    { name = "nvim_lua" },
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- texte du buffer courant
    { name = "path" }, -- chemins dy système de fichier
    { name = "emoji" }, -- emojis
  }),

  formatting = {
    -- Comportement par défaut
    expandable_indicator = true,
    -- Champs affichés par défaut
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format({
      mode = "symbol_text",
      -- On suffixe chaque entrée par son type
      menu = {
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        emoji = "[Emoji]",
      },
    }),
  },
})

-- `/` complétion
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- `:` complétion
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

