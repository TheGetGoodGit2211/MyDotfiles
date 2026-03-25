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
        ensure_installed = servers
      })
    end,
  },
  "neovim/nvim-lspconfig",
}
