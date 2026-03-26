return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()

			vim.keymap.set("n", "<leader>ms", ":Mason<CR>")
		end,
	},
	{
		"williamboman/mason-lspconfig",
		config = function()
			local servers = require("user.servers")

			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local formatters = require("user.formatters")

			require("mason-tool-installer").setup({
				ensure_installed = formatters,
			})
		end,
	},
	"neovim/nvim-lspconfig",
}
