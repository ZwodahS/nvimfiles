local m = require('conf.mappings')
local api = vim.api
local vim_home = vim.fn.stdpath("config")
vim.g.vim_home = vim_home
vim.g.python3_host_prog = vim_home .. "/venv3/bin/python"
------ Tabs
vim.cmd("set softtabstop=4")
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set relativenumber")
vim.cmd("set number")
------ Options
vim.opt.listchars = { eol = '↵', tab = '¬ ', space = '•' }
vim.opt.wrap = false
vim.opt.directory = vim_home .. "/.swp"
vim.opt.colorcolumn = "119,120"
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.equalalways = false
vim.opt.pumheight=10 -- limit the number of items in popup menu
------ Windowing (the mappings are in settings.lua)
vim.cmd("set splitbelow")
vim.cmd("set splitright")
------ Cursor Line / Cursor Column
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set completeopt=menuone,noselect,noinsert")

-- Always keep the split resized equally, only applies to file via *.*
vim.cmd("autocmd WinEnter *.* wincmd =")
