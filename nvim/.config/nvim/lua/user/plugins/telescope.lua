return {

  "nvim-telescope/telescope.nvim",
  dependencies = {

    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "folke/noice.nvim",
  },

  config = function()
    require("telescope").setup({

      extensions = {

        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        ["file_browser"] = {
          hidden = true,
          hijack_netrw = true,
        },
      },
   })


    -- plugin keybinds
    vim.keymap.set("n", "<leader>bf", ":Telescope file_browser<CR>")


    require("telescope").load_extension("noice")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("file_browser")
  end,
}
