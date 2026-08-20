local create_autocmd = vim.api.nvim_create_autocmd
local create_cmd = vim.api.nvim_create_user_command

local create_group = vim.api.nvim_create_augroup
local exec_cmd = vim.api.nvim_exec_autocmds

local new_file = create_group("new_file", {clear = true})

create_autocmd({"BufNewFile"}, {
    group = new_file,
    pattern = {'*.py'},
    command = '0r /home/mathledantec/.config/nvim/templates/template.py',
    desc = 'Opens a template when entering a new file.',
})
create_autocmd({"BufNewFile"}, {
    group = new_file,
    pattern = {'*.sh'},
    command = '0r /home/mathledantec/.config/nvim/templates/template.sh',
    desc = 'Opens a template when entering a new file.',
})


-- https://github.com/nvim-lua/kickstart.nvim/tree/master
local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()

  if result.code ~= 0 then
    local stderr = result.stderr or ""
    local stdout = result.stdout or ""
    local output = stderr ~= "" and stderr or stdout

    if output == "" then
      output = "No output from build command."
    end

    vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
  end
end

create_autocmd("PackChanged", {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind

    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "LuaSnip" then
      if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
        run_build(name, { "make", "install_jsregexp" }, ev.data.path)
      end
      return
    end

    if name == "nvim-treesitter" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end

      vim.cmd("TSUpdate")

      return
    end
  end,
})

create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    -- import nvim-autopairs
    local autopairs = require("nvim-autopairs")

    -- configure autopairs
    autopairs.setup({
      check_ts = true, -- enable treesitter
      disable_filetype = { "TelescopePrompt" },
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
        java = false, -- don't check treesitter on java
      },
    })

    -- import nvim-autopairs completion functionality
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- import nvim-cmp plugin (completions plugin)
    local cmp = require("cmp")

    -- make autopairs and completion work together
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
})

create_cmd("ToggleInlayHints", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toogle inlay hints in current buffer" })



