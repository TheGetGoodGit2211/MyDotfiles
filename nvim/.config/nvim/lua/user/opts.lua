-- set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- file encoding stuff
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"


-- misc stuff
vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true

vim.opt.autoread = true


-- tab and space stuff and all that
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.wo.relativenumber = true

vim.opt.conceallevel = 2

vim.opt.autochdir = true


-- file handling keybinds
vim.keymap.set("n", "<leader>wf", ":w<CR>")
vim.keymap.set("n", "<leader>sf", ":source %<CR>")
vim.keymap.set("n", "<leader>qd", ":q!<CR>")
vim.keymap.set("n", "<leader>qf", ":q<CR>")
vim.keymap.set("n", "<leader>qs", ":wq<CR>")
