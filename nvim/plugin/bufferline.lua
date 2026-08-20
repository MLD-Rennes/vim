vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/akinsho/bufferline.nvim",
})
require("bufferline").setup({
  options = {
    separator_style = "slant",
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    diagnostics = "nvim_lsp",
  },
})

