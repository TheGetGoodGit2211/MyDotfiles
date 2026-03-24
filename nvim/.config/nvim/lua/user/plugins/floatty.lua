return {
  "ingur/floatty.nvim",
  config = function()
    local term = require("floatty").setup({})
    vim.keymap.set('n', '<C-[>', function() term.toggle() end)
    vim.keymap.set('t', '<C-[>', function() term.toggle() end)
  end,
}
