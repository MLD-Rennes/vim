vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		css = { "prettier" },
		json = { "prettier" },
		html = { "prettier" },
		lua = { "stylua" },
		markdown = { "prettier" },
		python = { "ruff_fix", "ruff_format" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		yaml = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
	conform.format({
		lsp_format = "fallback",
		async = false,
		timeout_ms = 1000,
	})
end, { desc = "Format file or range (in visual mode)" })
