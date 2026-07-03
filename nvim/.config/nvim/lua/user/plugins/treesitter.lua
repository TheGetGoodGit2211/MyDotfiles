return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {},
		lazy = false,
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local grammars = require("user.grammars")

			require("nvim-treesitter").setup({
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})

			local installed = require("nvim-treesitter.config").get_installed()

			local to_install = {}
			for _, lang in ipairs(grammars) do
				if not vim.tbl_contains(installed, lang) then
					table.insert(to_install, lang)
				end
			end

			if #to_install > 0 then
				require("nvim-treesitter").install(to_install)
			end

			-- require("nvim-treesitter").install(grammars)
		end,
	},
}
