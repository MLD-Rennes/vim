local fzf_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/telescope-fzf-native.nvim"
local is_windows = vim.fn.has("win32") == 1
local lib_name = is_windows and "libfzf.dll" or "libfzf.so"
local lib_path = fzf_path .. "/build/" .. lib_name

local function notify(msg, level)
    vim.schedule(function()
        vim.notify(msg, level)
    end)
end

if vim.fn.isdirectory(fzf_path) == 1 and vim.fn.filereadable(lib_path) == 0 then
    notify("Building telescope-fzf-native...", vim.log.levels.INFO)

    vim.system(
        { "cmake", "-S.", "-Bbuild", "-DCMAKE_BUILD_TYPE=Release" },
        { cwd = fzf_path },
        function(configure_obj)
            if configure_obj.code ~= 0 then
                notify("fzf-native cmake configure failed:\n" .. (configure_obj.stderr or configure_obj.stdout or ""),
                    vim.log.levels.ERROR)
                return
            end

            vim.system(
                { "cmake", "--build", "build", "--config", "Release" },
                { cwd = fzf_path },
                function(build_obj)
                    if build_obj.code ~= 0 then
                        notify("fzf-native cmake build failed:\n" .. (build_obj.stderr or build_obj.stdout or ""),
                            vim.log.levels.ERROR)
                        return
                    end

                    if not is_windows then
                        -- Unix Makefiles generator already places libfzf.so in build/ directly.
                        notify("fzf-native built successfully, restart Neovim", vim.log.levels.INFO)
                        return
                    end

                    -- Windows uses a multi-config generator (Release goes to build/Release/),
                    -- so an explicit install step is needed to move the dll back to build/.
                    vim.system(
                        { "cmake", "--install", "build", "--prefix", "build" },
                        { cwd = fzf_path },
                        function(install_obj)
                            if install_obj.code ~= 0 then
                                notify(
                                    "fzf-native cmake install failed:\n" ..
                                    (install_obj.stderr or install_obj.stdout or ""),
                                    vim.log.levels.ERROR)
                            else
                                notify("fzf-native built successfully, restart Neovim", vim.log.levels.INFO)
                            end
                        end
                    )
                end
            )
        end
    )
end

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
