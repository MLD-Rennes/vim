return {
  "neovim/nvim-lspconfig",
  event = "VimEnter",
  lazy = false,
  config = function()
    vim.lsp.config("lmp_lsp", {
      cmd = { "/home/mathledantec/.cargo/bin/lmp-lsp" },
      filetypes = { "lammps" },
--      root_dir = function(bufnr)
--        return vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr))
--      end,
    })
    vim.lsp.enable("lmp_lsp")
  end,
}
