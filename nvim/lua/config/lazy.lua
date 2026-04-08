-- Mise en place et installation de lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  error("lazy.nvim not found at " .. lazypath .. ". Please install it manually.")
end
vim.opt.rtp:prepend(lazypath)

-- Configuration de lazy.nvim et importation du répertoire `plugins`
require("lazy").setup({ { import = "plugins" } }, {
  -- désactive la pénible notification au démarrage
  change_detection = {
    notify = false,
  },
})

