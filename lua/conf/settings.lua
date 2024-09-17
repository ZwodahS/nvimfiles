local m = require('conf.mappings')
local api = vim.api
local vim_home = vim.fn.stdpath("config")
vim.g.vim_home = vim_home
vim.g.python3_host_prog = vim_home .. "/venv3/bin/python"
------ Unbind stuffs
m.nmap('Q', '<NOP>')
m.nmap('<C-G>', '<NOP>')
m.nmap('<C-H>', '<NOP>')
m.nmap('<C-Q>', '<NOP>')
m.nmap('<C-T>', '<NOP>')
-- Used to be mapped to resize, but we have since use auto resized, so we disable these too
m.nmap('<Up>', '<NOP>')
m.nmap('<Down>', '<NOP>')
m.nmap('<Left>', '<NOP>')
m.nmap('<Right>', '<NOP>')
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
------ various key mappings
-- set the character for EOL and tabs
m.nmap('<leader>l', ':set list!<CR>')
-- line number and relative number switching
m.nmap('<leader>nn', ':set number!<CR>')
m.nmap('<leader>nr', ':set relativenumber!<CR>')
m.vmap('<C-I>', '<ESC>:set relativenumber!<CR>gv')
-- clear search
m.nmap('<leader>gc', ':nohlsearch<CR>')
-- toggle wrap
m.nmap('<leader>w', ':set wrap!<CR>')
-- Toggle paste mode, (aka turn off smart indent)
m.nmap('<leader>i', ':set paste!<CR>')
---- Folding remap
-- - to fold/close +/= to open
-- map C-j C-k for moving by fold
m.xmap('-', 'zf')
m.nmap('-', 'zc')
m.nmap('=', 'zo')
m.nmap('+', 'zO')
m.nmap('<C-j>', 'zj')
m.nmap('<C-k>', 'zk')
-- Fold method forcing
m.nmap('zs', ':setlocal foldmethod=syntax<CR>')
m.nmap('zi', ':setlocal foldmethod=indent<CR>')

---- Global Clipboard
m.vmap('gy', '"+y')
m.nmap('gp', '"+p')
m.vmap('gp', '"+p')

---- Tabs
-- open current buffer in new tab
m.nmap('<C-W>t', ':tab split<CR>')
-- close all tab except active
m.nmap('<C-W>r', ':tabonly<CR>')
-- close current active
m.nmap('<C-W><C-R>', ':tabclose<CR>')
m.nmap('<leader>tt2', ':set softtabstop=2<CR>:set tabstop=2<CR>:set shiftwidth=2<CR>:echo "Tab set to 2"<CR>')
m.nmap('<leader>tt4', ':set softtabstop=4<CR>:set tabstop=4<CR>:set shiftwidth=4<CR>:echo "Tab set to 4"<CR>')

---- Windows
-- resize splits
-- make it width 160, i.e. the main window

---- QOL
m.nmap('<leader><Enter>', ':FineCmdline<CR>')
-- m.nmap('<Enter>', ':')
m.nmap('<Space>', 'f<space>');
-- paste while in insert mode
m.imap('<C-E><C-I>', '<ESC>pa')
-- map <C-d> to del
m.imap('<C-d>', "<DEL>")

---- Whitespace removal
m.nmap('<leader><Space>', ':FixWhitespace<CR>')
m.xmap('<leader><Space>', ':FixWhitespace<CR>')

---- Date generation
m.imap('<C-e><C-e>', '<C-R>=expand("%:t:r")<CR>')
m.imap('<C-e><C-d>', '<C-R>=strftime("%d %b %Y")<CR>')
m.imap('<C-e><C-t>', '<C-R>=strftime("%a %H:%M:%S %d %b %Y")<CR>')

---- Create a xml/html tag on a text
m.vmap('<C-x><C-x>', 'xa<<ESC>pa></<ESC>pa><ESC>F>a');

-- Always keep the split resized equally, only applies to file via *.*
vim.cmd("autocmd WinEnter *.* wincmd =")
