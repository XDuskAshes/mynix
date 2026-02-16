-- Personal NeoVim configurations by XDuskAshes

-- Keymaps

local map = vim.keymap.set

vim.g.mapleader = " "

-- Line numbering
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- custom mappings
--map("n","w", function() vim.cmd("w"); vim.cmd("echo 'Written.'") end)
map("n",";",":")
map("n","qq",":q<CR>")
map("n","qf",":q!<CR>")
map("n","qw",":wq<CR>")
map("n","qb", function() vim.cmd("bd"); vim.cmd("echo 'Quit the current buffer/file.'") end)

-- Plugin mappings

-- telescope
map("n","<LocalLeader>ff",":Telescope find_files<CR>")
map("n","<LocalLeader>fo",":Telescope oldfiles<CR>")

-- tabs
map("n","<LocalLeader>tn",":tabnew<CR>")
map("n","<LocalLeader>tl",":tabnext<CR>")
map("n","<LocalLeader>th",":tabprevious<CR>")
map("n","<LocalLeader>tc",":tabclose<CR>")

-- vimwiki
map("n","<LocalLeader>ww",":VimwikiIndex<CR>")

