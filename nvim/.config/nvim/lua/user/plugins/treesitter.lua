-- note: must have tree-sitter-cli installed for this to work
return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {},
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local langs = {
        "lua",
        "java",
        "cpp",
        "cmake",
        "rust",
      }

      require("nvim-treesitter").setup({
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
      require("nvim-treesitter").install(langs)
    end,
  },
}
