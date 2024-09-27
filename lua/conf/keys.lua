local m = require("conf.mappings")

-- Fri 14:48:31 27 Sep 2024
-- Decided to move all the key mappings to a single file, which allows us to see them all at the same place

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

------ various key mappings for viewing
-- set the character for EOL and tabs
m.nmap('<leader>vl', ':set list!<CR>')
m.nmap('<leader>vn', ':set number!<CR>')
m.nmap('<leader>vr', ':set relativenumber!<CR>')
-- visual mode to turn on relative number
m.vmap('<C-I>', '<ESC>:set relativenumber!<CR>gv')

-- create new files binding via <leader>n<X>
m.nmap('<leader>nf', ':e %:h/') -- create a new file in the same directory as the current file

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

---- plugins/todocomment
-- Tue 12:17:38 24 Sep 2024
-- Disable these for now. We can achieve them via <C-T><C-D> mostly
-- Tempted to also disable ISTOPHERE and HERE but I think I want it.
m.nmap("<C-T><C-R>", "<cmd>TodoTelescope keywords=ISTOPHERE,HERE<CR>")
-- m.nmap("<C-T><C-T><C-T>", "<cmd>TodoTelescope keywords=TODO<CR>")
-- m.nmap("<C-T><C-T><C-F>", "<cmd>TodoLocList<CR>")
m.nmap("<C-T><C-D>", "<cmd>TodoTelescope<CR>")
m.nmap("]t", '<cmd>lua require("todo-comments").jump_next()<CR>')
m.nmap("[t", '<cmd>lua require("todo-comments").jump_prev()<CR>')

---- plugins/telescope
-- find files
m.nmap('<C-P>', '<cmd>Telescope find_files previewer=false theme=get_dropdown<CR>')
m.nmap('<C-T><C-P>', '<cmd>Telescope find_files previewer=false theme=get_dropdown<CR>')
-- open tags
-- Mon 12:30:20 26 Aug 2024 Tag disabled for now, since I don't use it as much
-- m.nmap('<C-T><C-T>', '<cmd>Telescope current_buffer_tags theme=get_dropdown<CR>')
m.nmap('<C-T><C-J>', '<cmd>Telescope jumplist<CR>')
-- search buffer name
m.nmap('<C-T><C-B>', '<cmd>Telescope buffers theme=get_dropdown<CR>')
-- this search symlink
-- m.nmap('<leader>tg', '<cmd>Telescope live_grep find_command=rg,--follow,--files<CR>')
-- this does not search symlink
m.nmap('<C-T><C-S>', '<cmd>Telescope live_grep<CR>')
m.nmap('<C-T><C-W>', '<cmd>Telescope grep_string<CR>')
m.nmap('<C-T><C-E><C-J>', '<cmd>Telescope emoji<CR>')
m.imap('<C-E><C-J>', '<ESC><cmd>Telescope emoji<CR>')
m.nmap("<C-T>f", "<cmd>Telescope file_browser<CR>")
m.nmap("<C-T><C-F>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>")

---- plugins/colorizer
m.nmap("<leader>ct", ":ColorizerToggle<CR>")

---- plugins/gitgutter
-- TODO: Fix this. I think GitGitter is no longer working :(
m.nmap("<leader>hg", "GitGutterToggle<CR>")
m.nmap("<leader>hp", "GitGutterPreviewHunk<CR>")
m.nmap("<leader>hr", "GitGutterUndoHunk<CR>")

---- Motions via plugins/easymotion plugins/hop
m.nmap('J', ':HopLineAC<CR>')
m.nmap('K', ':HopLineBC<CR>')
m.nmap(',w', ':HopWordAC<CR>')
m.nmap(',b', ':HopWordBC<CR>')
-- Use Easy Motion for / because hop doesn't do what I want
m.nmap("/", "<Plug>(easymotion-sn)")
vim.g.EasyMotion_keys = "qwertasdfgpoiulkjhvcbnm"

---- Color words
m.nmap("<leader>1", ":call HiInterestingWord(1)<cr>")
m.nmap("<leader>2", ":call HiInterestingWord(2)<cr>")
m.nmap("<leader>3", ":call HiInterestingWord(3)<cr>")
m.nmap("<leader>4", ":call HiInterestingWord(4)<cr>")
m.nmap("<leader>5", ":call HiInterestingWord(5)<cr>")
m.nmap("<leader>6", ":call HiInterestingWord(6)<cr>")

---- Jopvim
m.nmap('<leader>j', '<cmd>lua require("jopvim.telescope").joplin_notes()<CR>')
m.nmap('<leader>k', '<cmd>lua require("jopvim.telescope").joplin_folders()<CR>')

---- plugins/nvim-tree
m.nmap("<leader>f", ":NvimTreeFocus <CR>")
m.nmap("<leader>F", ":NvimTreeFindFile<CR>:NvimTreeFocus<CR>")

---- Tags
-- https://github.com/semanticart/tag-peek.vim
m.nmap('<C-T><C-G>', ':call tag_peek#ShowTag()<CR>')
m.nmap('<leader>tg', ':TagbarToggle<CR>')

---- plugins/undotree
m.nmap('<leader>gg', ':UndotreeToggle<CR>')

---- plugins/snippets
vim.cmd([[
imap <expr><C-t> vsnip#expandable() ? '<Plug>(vsnip-expand)'         : vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)': '<C-t>'
smap <expr><C-t> vsnip#expandable() ? '<Plug>(vsnip-expand)'         : vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)': '<C-t>'
imap <expr><C-S-t> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-S-t>'
smap <expr><C-S-t> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-S-t>'
]])

---- plugins/windowswap
m.nmap("<C-W>y", ":call WindowSwap#MarkWindowSwap()<CR>")
m.nmap("<C-W>p", ":call WindowSwap#DoWindowSwap()<CR>")
