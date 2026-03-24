return {
  "ingur/floatty.nvim",
  config = function()
    local term = require("floatty").setup({})
    vim.keymap.set('n', '<C-z>', function() term.toggle() end)
    vim.keymap.set('t', '<C-z>', function() term.toggle() end)
  end,
}
