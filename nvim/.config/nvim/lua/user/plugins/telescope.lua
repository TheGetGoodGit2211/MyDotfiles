return {

  "nvim-telescope/telescope.nvim",
  dependencies = {

    "nvim-lua/plenary.nvim",
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


    -- binds
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>tbb", builtin.buffers, {})             -- [T]elescope [B]rowse  [B]uffers
    vim.keymap.set("n", "<leader>tbf", ":Telescope file_browser<CR>")   -- [T]elescope [B]rowse  [F]iles
    vim.keymap.set("n", "<leader>tbg", builtin.git_files, {})           -- [T]elescope [B]rowse  [G]it
    vim.keymap.set("n", "<leader>tgd", builtin.lsp_definitions, {})     -- [T]elescope [G]oto    [D]efinitions
    vim.keymap.set("n", "<leader>tgi", builtin.lsp_implementations, {}) -- [T]elescope [G]oto    [I]mplementations
    vim.keymap.set("n", "<leader>tgr", builtin.lsp_references, {})      -- [T]elescope [G]oto    [R]eferences
    vim.keymap.set("n", "<leader>tld", builtin.diagnostics, {})         -- [T]elescope [L]ist    [D]iagnostics
    vim.keymap.set("n", "<leader>tlf", builtin.find_files, {})          -- [T]elescope [L]ist    [F]iles
    vim.keymap.set("n", "<leader>tlg", builtin.live_grep, {})           -- [T]elescope [L]ist by [G]rep


    require("telescope").load_extension("noice")
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("file_browser")
  end,
}
