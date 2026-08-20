local create_autocmd = vim.api.nvim_create_autocmd
create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
        vim.system({ 'cmake', '-S.', '-Bbuild', '-DCMAKE_BUILD_TYPE=Release' },
        { cwd = ev.data.path }, function(obj)
            if obj.code ~= 0 then
                vim.notify 'cmake --build failed for telescope-fzf-native.nvim'
            else
                vim.system({ 'cmake', '--build', 'build', '--config', 'Release', '--target', 'install' }, { cwd = ev.data.path })
            end
        end)
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
})

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {

    -- Parce que c’est joli
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzf = {
        fuzzy = true,
        override_generic_order = false,
        override_file_sorter = true,
        case_mode = "smart_case",
    },
  },
})

telescope.load_extension("fzf")

-- set keymaps
local keymap = vim.keymap -- for conciseness

keymap.set(
  "n",
  "<leader>ff",
  "<cmd>Telescope find_files<cr>",
  { desc = "Recherche de chaînes de caractères dans les noms de fichiers" }
)
keymap.set(
  "n",
  "<leader>fg",
  "<cmd>Telescope live_grep<cr>",
  { desc = "Recherche de chaînes de caractères dans le contenu des fichiers" }
)
keymap.set(
  "n",
  "<leader>fb",
  "<cmd>Telescope buffers<cr>",
  { desc = "Recherche de chaînes de caractères dans les noms de buffers" }
)
keymap.set(
  "n",
  "<leader>fx",
  "<cmd>Telescope grep_string<cr>",
  { desc = "Recherche de la chaîne de caractères sous le curseur" }
)

